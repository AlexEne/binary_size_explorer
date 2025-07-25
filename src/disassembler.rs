use std::fmt::Write;

use egui::{ScrollArea, Ui};
use egui_extras::{Column, Table, TableBuilder};

use crate::{
    arena::{scratch::scratch_arena, string::String},
    data_provider_twiggy::DataProviderTwiggy,
};

pub struct WASMDisassemblerViewer;

impl WASMDisassemblerViewer {
    pub fn view_function<'a>(
        ui: &mut Ui,
        data_provider: &DataProviderTwiggy,
        function_idx: usize,
        selected_row: &mut Option<usize>,
    ) {
        const ROW_HEIGHT: f32 = 20.0;

        let function_data = &data_provider.raw_data[function_idx];

        let locals = &function_data.debug_info.locals;
        let function_ops = &function_data.debug_info.function_ops;

        let total_rows = locals.len() + function_ops.len();
        // 3 + 20
        // [1, 11]
        // [1, 2]
        // [0]

        let table = TableBuilder::new(ui)
            .striped(true)
            .column(Column::exact(20.0))
            .column(Column::remainder());

        // table.header(20.0, |row| {
        //     row.col(|ui| {
        //         ui.label("Line");
        //     });
        //     row.col(|ui| {
        //         ui.label("Instruction");
        //     });
        // })

        table.body(|body| {
            body.rows(ROW_HEIGHT, total_rows, |mut row| {
                let row_idx = row.index();

                row.col(|ui| {
                    ui.label("0");
                });

                row.col(|ui| {
                    let scratch = scratch_arena(&[]);
                    let mut buffer = String::new(&scratch, 1024);

                    if row_idx < locals.len() {
                        _ = buffer.write_fmt(format_args!("{:?}", locals[row_idx]));
                    } else {
                        let idx = row_idx - locals.len();

                        match function_ops[idx].op {
                            wasmparser::Operator::Call { function_index } => {
                                let callee_function =
                                    data_provider.wasm_data.functions_section.function_names
                                        [function_index as usize];

                                _ = buffer.write_fmt(format_args!("call ${}", callee_function));

                                let response = ui.label(buffer.as_str());

                                if response.clicked() {
                                    *selected_row = Some(function_index as usize)
                                }

                                response.on_hover_text(format!(
                                    "Function: {}\nFunction Index: {}",
                                    callee_function, function_index,
                                ));
                            }
                            _ => {
                                _ = buffer.write_fmt(format_args!("{:?}", function_ops[idx].op));
                                ui.label(buffer.as_str());
                            }
                        }
                    }
                });
            });
        });

        // ScrollArea::both().show_rows(ui, ROW_HEIGHT, total_rows, |ui, row_range| {
        //     let scratch = scratch_arena(&[]);
        //     let mut buffer = String::new(&scratch, 1024);

        //     for row_idx in row_range {
        //         buffer.clear();

        //         if row_idx < locals.len() {
        //             _ = buffer.write_fmt(format_args!("{:?}", locals[row_idx]));
        //         } else {
        //             let idx = row_idx - locals.len();

        //             _ = buffer.write_fmt(format_args!("{:?}", function_ops[idx].op));
        //         }

        //         ui.label(buffer.as_str());
        //     }
        // });
    }
}
