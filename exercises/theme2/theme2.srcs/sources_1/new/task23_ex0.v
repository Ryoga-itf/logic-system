// File: task23_ex0.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task23_ex0(
    input clk,
    input [3:0]din,
    output [3:0]dout
);

    ram_task23 ram_inst(
        .addra(5'b00001),
        .clka(clk),
        .dina(din),
        .douta(dout),
        .wea(1'b1)
    );

endmodule // task23_ex0
