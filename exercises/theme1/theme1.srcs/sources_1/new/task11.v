// File: task11.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task11(
    input [1:0]a,
    input [1:0]b,
    output [2:0]q
);

    assign q = a + b;

endmodule // task11
