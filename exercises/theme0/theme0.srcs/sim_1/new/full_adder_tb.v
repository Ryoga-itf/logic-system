// File: full_adder_tb.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module full_adder_tb();

    reg _x;
    reg _y;
    reg _c;
    wire [1:0] _q;
    
    initial begin
        _x <= 1'b0;
        _y <= 1'b0;
        _c <= 1'b0;
    #10 _x <= 1'b1;
        _y <= 1'b0;
        _c <= 1'b0;
    #10 _x <= 1'b0;
        _y <= 1'b1;
        _c <= 1'b0;
    #10 _x <= 1'b1;
        _y <= 1'b1;
        _c <= 1'b0;
    #10 _x <= 1'b0;
        _y <= 1'b0;
        _c <= 1'b1;
    #10 _x <= 1'b1;
        _y <= 1'b0;
        _c <= 1'b1;
    #10 _x <= 1'b0;
        _y <= 1'b1;
        _c <= 1'b1;
    #10 _x <= 1'b1;
        _y <= 1'b1;
        _c <= 1'b1;
    #10 $finish;
    end
    
    full_adder c0(.x(_x), .y(_y), .c(_c), .q(_q));
    
endmodule
