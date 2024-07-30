// File: logic_circuit0.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task00(
    input wire i0,
    input wire i1,
    input wire sel,
    output wire q
);

    assign q = !sel && i0 || sel && i1;
    // assign q = (sel == 1) ? i1 : i0;

endmodule // task00
