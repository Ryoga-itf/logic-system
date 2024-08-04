// File: task22_ex2.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task22_ex2(
    input clk,
    output [3:0]ld
);
    reg [3:0]deccnt;
    reg [31:0]scnt;

    parameter SMAX = 125000000 - 1;

    initial begin
        deccnt <= 0;
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
            if (deccnt == 9) begin
                deccnt <= 0;
            end else begin
                deccnt <= deccnt + 1;
            end
        end
    end

    assign ld = deccnt;
endmodule // task22_ex2
