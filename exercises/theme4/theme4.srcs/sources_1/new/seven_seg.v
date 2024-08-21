// File: seven_seg.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module seven_seg(
    input [3:0]din,
    input sel_in,
    output  [6:0]seg,
    output  sel_out
);
    assign seg[6] =  ~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
    assign seg[5] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
    assign seg[4] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
    assign seg[3] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0];
    assign seg[2] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&~din[1]&din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]| din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&din[0]; 
    assign seg[1] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&~din[1]&din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0];
    assign seg[0] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];

    assign sel_out = sel_in;
endmodule // seven_seg
