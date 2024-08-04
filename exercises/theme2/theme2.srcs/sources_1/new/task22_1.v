// File: task22_1.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task22_1(
    input clk,
    output [3:0]ld
);
    reg [3:0]deccnt;
    reg [31:0]scnt;

    parameter SMAX = 125000000 - 1;

    initial begin
        deccnt <= 9;
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
            if (deccnt == 0) begin
                deccnt <= 9;
            end else begin
                deccnt <= deccnt - 1;
            end
        end
    end

    assign ld = deccnt;
endmodule // task22_1
