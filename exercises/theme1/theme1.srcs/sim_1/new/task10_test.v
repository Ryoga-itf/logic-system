// File: task10_test.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task10_test();

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
    
    task10_full c0(.sw0(_x), .sw1(_y), .sw2(_c), .ld(_q));
    
endmodule // task10_test
