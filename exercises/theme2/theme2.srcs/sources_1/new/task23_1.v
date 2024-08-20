// File: task23_1.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task23_1(
    input clk,
    input btn0,
    input [3:0]sw,
    output [3:0]dout
);

    if (btn0 == 1) begin
        ram_task23 ram_inst(
            .addra(5'b00001),
            .clka(clk),
            .dina(sw),
            .douta(dout),
            .wea(1'b1)
        );
    end

endmodule // task23_1
