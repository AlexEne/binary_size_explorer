use std::usize;

use egui::{
    Align, Color32, Label, Layout, Response, RichText, Shape, Stroke, StrokeKind, Vec2, WidgetText,
};
use egui_extras::{Column, TableBuilder};

use crate::arena::{scratch::scratch_arena, string::String};

const CELLS_PER_ROW: usize = 16;
const CELL_SIZE: Vec2 = Vec2::new(30.0, 16.0);

#[derive(Clone, Copy)]
struct MemoryViewerState {
    selected_offset: usize,
}

pub struct MemoryViewer;

impl MemoryViewer {
    pub fn show(ui: &mut egui::Ui, data: &[u8]) {
        let scratch = scratch_arena(&[]);

        let id = ui.make_persistent_id("__memory_viewer_state");

        let mut selected_offset = ui.data_mut(|map| {
            map.get_temp::<MemoryViewerState>(id)
                .map(|state| state.selected_offset)
                .unwrap_or(usize::MAX)
        });

        let main_column_width = CELLS_PER_ROW as f32 * CELL_SIZE.x
            + (CELLS_PER_ROW as f32 - 1.0) * ui.spacing().item_spacing.x;

        let table = TableBuilder::new(ui)
            .column(Column::exact(80.0))
            .column(Column::exact(main_column_width))
            .column(Column::exact(120.0))
            .cell_layout(egui::Layout::left_to_right(Align::Center))
            .striped(true)
            .min_scrolled_height(500.0)
            .resizable(false);

        table
            .header(20.0, |mut header| {
                header.col(|ui| {
                    ui.with_layout(Layout::left_to_right(Align::Min), |ui| {
                        ui.strong("Address");
                    });
                });

                header.col(|ui| {
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("0").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("1").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("2").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("3").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("4").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("5").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("6").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("7").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("8").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("9").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("A").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("B").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("C").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("D").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("E").strong()));
                    ui.add_sized(CELL_SIZE, Label::new(WidgetText::from("F").strong()));
                });

                header.col(|ui| {
                    ui.with_layout(Layout::left_to_right(Align::Min), |ui| {
                        ui.strong("ASCII");
                    });
                });
            })
            .body(|body| {
                let mut buffer = String::new(&scratch, CELLS_PER_ROW);

                body.rows(
                    20.0,
                    (data.len() + CELLS_PER_ROW - 1) / CELLS_PER_ROW,
                    |mut row| {
                        row.col(|ui| {
                            ui.monospace("0x00000000");
                        });

                        let offset = row.index() * CELLS_PER_ROW;
                        let len = (data.len() - offset).min(CELLS_PER_ROW);
                        let data = &data[offset..(offset + len)];

                        row.col(|ui| {
                            for i in 0..CELLS_PER_ROW {
                                let byte = data.get(i).copied().unwrap_or(0);

                                let response = Self::show_cell(ui, byte, &mut buffer);
                                if response.hovered() {
                                    selected_offset = offset + i;
                                }

                                if selected_offset == offset + i {
                                    ui.painter().add(Shape::rect_stroke(
                                        response.rect,
                                        0.0,
                                        Stroke::new(3.0, Color32::GRAY),
                                        StrokeKind::Outside,
                                    ));
                                }
                            }
                        });

                        row.col(|ui| {
                            buffer.clear();
                            buffer.push_str("................");

                            for idx in 0..data.len() {
                                if data[idx].is_ascii_graphic() {
                                    unsafe {
                                        buffer.as_bytes_mut()[idx] = data[idx];
                                    }
                                }
                            }

                            let response = ui.monospace(buffer.as_str());
                            let mut rect = response.rect;
                            let pixels_per_byte = rect.width() / CELLS_PER_ROW as f32;

                            if response.hovered() {
                                if let Some(hover_pos) = response.hover_pos() {
                                    let i = (((hover_pos.x - rect.min.x) / rect.width()).min(0.99)
                                        * CELLS_PER_ROW as f32)
                                        as usize;

                                    selected_offset = offset + i;
                                }
                            }

                            if selected_offset >= offset && selected_offset < offset + CELLS_PER_ROW
                            {
                                let i = selected_offset - offset;

                                rect.min.x += pixels_per_byte * i as f32;
                                rect.max.x = rect.min.x + pixels_per_byte;

                                ui.painter().add(Shape::rect_stroke(
                                    rect,
                                    0.0,
                                    Stroke::new(3.0, Color32::GRAY),
                                    StrokeKind::Outside,
                                ));
                            }
                        });
                    },
                );
            });

        // Stores new selected_offset
        ui.data_mut(|map| {
            map.get_temp_mut_or::<MemoryViewerState>(
                id,
                MemoryViewerState {
                    selected_offset: usize::MAX,
                },
            )
            .selected_offset = selected_offset
        });
    }

    fn show_cell(
        ui: &mut egui::Ui,
        byte: u8,
        buffer: &mut crate::arena::string::String<'_>,
    ) -> Response {
        use std::fmt::Write;

        buffer.clear();
        _ = write!(buffer, "{:#04x}", byte);
        ui.add_sized(
            CELL_SIZE,
            Label::new(RichText::new(buffer.as_str()).monospace()),
        )
    }
}
