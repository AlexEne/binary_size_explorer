use egui::{
    Align, Color32, ComboBox, Direction, Id, Label, Layout, Rect, Response, RichText, ScrollArea,
    Sense, Shape, Stroke, StrokeKind, TextStyle, TextWrapMode, Widget, WidgetText,
    epaint::RectShape, pos2, vec2,
};
use egui_extras::{Column, Table, TableBuilder};

use crate::{
    arena::{Arena, array::Array, scratch::scratch_arena, string::String},
    data_provider::{Filter, FunctionsView, ViewMode},
    data_provider_twiggy::DataProviderTwiggy,
    gui::tree_view::TreeView,
};

pub struct MemoryViewer;

impl MemoryViewer {
    pub fn show(arena: &Arena, ui: &mut egui::Ui, data: &[u8]) {
        // let mut offset = 0;
        // let mut buffer = String::new(arena, 16);
        // ui.vertical(|ui| {
        //     while offset < data.len() {
        //         let len = usize::min(data.len() - offset, 16);
        //         let data = &data[offset..len];

        //         ui.horizontal(|ui| {
        //             // Each byte
        //             for &byte in data {
        //                 Self::show_cell(ui, byte, &mut buffer);
        //             }
        //         });

        //         offset += len;
        //     }
        // });

        let table = TableBuilder::new(ui)
            .column(Column::exact(50.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(30.0))
            .column(Column::exact(120.0))
            .cell_layout(egui::Layout::left_to_right(Align::Center))
            // .cell_layout(egui::Layout::centered_and_justified(Direction::LeftToRight))
            .striped(true)
            .resizable(false);

        table
            .header(18.0, |mut header| {
                header.col(|ui| {
                    ui.with_layout(Layout::left_to_right(Align::Min), |ui| {
                        ui.strong("Address");
                    });
                });

                header.col(|ui| {
                    // ui.allocate_ui_with_layout(
                    //     vec2(30.0, 18.0),
                    //     Layout::centered_and_justified(Direction::LeftToRight),
                    //     |ui| {
                    ui.strong("0");
                    //     },
                    // );
                });

                header.col(|ui| {
                    ui.strong("1");
                });

                header.col(|ui| {
                    ui.strong("2");
                });

                header.col(|ui| {
                    ui.strong("3");
                });

                header.col(|ui| {
                    ui.strong("4");
                });

                header.col(|ui| {
                    ui.strong("5");
                });

                header.col(|ui| {
                    ui.strong("6");
                });

                header.col(|ui| {
                    ui.strong("7");
                });

                header.col(|ui| {
                    ui.strong("8");
                });

                header.col(|ui| {
                    ui.strong("9");
                });

                header.col(|ui| {
                    ui.strong("A");
                });

                header.col(|ui| {
                    ui.strong("B");
                });

                header.col(|ui| {
                    ui.strong("C");
                });

                header.col(|ui| {
                    ui.strong("D");
                });

                header.col(|ui| {
                    ui.strong("E");
                });

                header.col(|ui| {
                    ui.strong("F");
                });

                header.col(|ui| {
                    ui.with_layout(Layout::left_to_right(Align::Min), |ui| {
                        ui.strong("ASCII");
                    });
                });
            })
            .body(|body| {
                let mut buffer = String::new(arena, 16);

                body.rows(18.0, (data.len() + 15) / 16, |mut row| {
                    row.col(|ui| {
                        ui.monospace("0x0000");
                    });

                    let offset = row.index() * 16;
                    let len = (data.len() - offset).min(16);
                    let data = &data[offset..(offset + len)];
                    let mut selected_idx: i8 = -1;

                    for i in 0..16 {
                        row.col(|ui| {
                            let byte = data.get(i).copied().unwrap_or(0);

                            let response = Self::show_cell(ui, byte, &mut buffer);
                            if response.hovered() {
                                selected_idx = i as i8;

                                ui.painter().add(Shape::rect_stroke(
                                    response.rect,
                                    0.0,
                                    Stroke::new(3.0, Color32::GRAY),
                                    StrokeKind::Outside,
                                ));
                            }
                        });
                    }

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

                        if selected_idx >= 0 {
                            println!("Selected_idx {}", selected_idx);

                            let mut rect = response.rect;
                            let width = rect.width() / 16.0;
                            let offset = selected_idx as f32 * width;
                            rect.min.x += offset;
                            rect.max.x = rect.min.x + width;

                            ui.painter().add(Shape::rect_stroke(
                                rect,
                                0.0,
                                Stroke::new(3.0, Color32::GRAY),
                                StrokeKind::Outside,
                            ));
                        }
                    });
                });
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
        ui.monospace(buffer.as_str())
    }
}
