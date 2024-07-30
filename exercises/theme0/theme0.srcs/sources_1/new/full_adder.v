// File: full_adder.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module half_adder(
    input x,
    input y,
    output [1:0]q 
);
    //q[0]: sum, q[1]: carry_out
    
    //sum
    assign q[0] = (x && !y) || (!x && y);
    //carry
    assign q[1] = x && y;
    
endmodule

module full_adder (
    input x,
    input y,
    input c,
    output [1:0]q 
);
    //q[0]: sum, q[1]: carry_out
    
    wire [1:0] w0;
    wire [1:0] w1;
    
    half_adder c0(.x(x), .y(y), .q(w0));
    half_adder c1(.x(w0[0]), .y(c), .q(w1));

    // sum
    assign q[0] = w1[0];
    // carry
    assign q[1] = w0[1] || w1[1];
    
endmodule
