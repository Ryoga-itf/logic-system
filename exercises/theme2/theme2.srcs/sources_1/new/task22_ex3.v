// File: task22_ex3.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task22_ex3(
    input clk,
    input btn0,
    output [3:0] ld
);
    reg [3:0] hexcnt;
    reg [31:0] scnt;

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
            if (btn0 == 1) begin
                hexcnt <= hexcnt + 1;
            end
        end
    end

    assign ld = hexcnt;
endmodule // task22_ex3
