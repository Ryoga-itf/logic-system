// File: task11_test.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task11_test();

    reg [1:0]_a;
    reg [1:0]_b;
    wire [2:0]_q;
    
    initial begin
        _a <= 2'b00;
        _b <= 2'b00;
    #10 _a <= 2'b01;
        _b <= 2'b00;
    #10 _a <= 2'b10;
        _b <= 2'b00;
    #10 _a <= 2'b11;
        _b <= 2'b00;

    #10 _a <= 2'b00;
        _b <= 2'b01;
    #10 _a <= 2'b01;
        _b <= 2'b01;
    #10 _a <= 2'b10;
        _b <= 2'b01;
    #10 _a <= 2'b11;
        _b <= 2'b01;

    #10 _a <= 2'b00;
        _b <= 2'b10;
    #10 _a <= 2'b01;
        _b <= 2'b10;
    #10 _a <= 2'b10;
        _b <= 2'b10;
    #10 _a <= 2'b11;
        _b <= 2'b10;

    #10 _a <= 2'b00;
        _b <= 2'b11;
    #10 _a <= 2'b01;
        _b <= 2'b11;
    #10 _a <= 2'b10;
        _b <= 2'b11;
    #10 _a <= 2'b11;
        _b <= 2'b11;
    #10 $finish;
    end
    
    task11 c0(.a(_a), .b(_b), .q(_q));
    
endmodule // task11_test
