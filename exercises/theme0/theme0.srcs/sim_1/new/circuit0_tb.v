// File: circuit0_tb.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module tb();

    reg [1:0] _i;
    reg _sel;
    wire _q;

    initial begin
        _sel <= 1'b0;
        _i <= 2'b00;
    #10 _i <= 2'b01;
    #10 _sel <= 1'b1;
        _i <= 2'b10;
    #15 _i <= 2'b11;
    #10 $finish;
    end

    task00 c0(.i0(_i[0]), .i1(_i[1]), .sel(_sel), .q(_q));

endmodule // tb
