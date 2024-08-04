// File: task22_ex0.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task22_ex0(
    input clk,
    output [3:0]ld
);
    reg [3:0]hexcnt;
    reg [31:0]scnt;

    parameter SMAX = 125000000 - 1;

    initial begin
        hexcnt <= 0;
        scnt <= 0;
    end

    always@(posedge clk) begin
        if (scnt < SMAX) begin
            scnt <= scnt + 1;
        end else begin
            scnt <= 0;
        end
    end

    always@(posedge clk) begin
        if (scnt == SMAX) begin
            hexcnt <= hexcnt + 1;
        end
    end

    assign ld = hexcnt;
endmodule // task22_ex0
