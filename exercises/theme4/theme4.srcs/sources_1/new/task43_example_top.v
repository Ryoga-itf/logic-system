// File: task43_example_top.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task43_example_top(clk, sw, push, pop, ld, ld_full, ld_empty);
    `include "parameters_task43.v"

    input clk;
    input [IO_WIDTH-1:0] sw;
    input push;
    input pop;
    output [IO_WIDTH-1:0] ld;
    output ld_full;
    output ld_empty;

    wire [1:0] pulse_btn;

    pulse_generator _btn0(.clk(clk), ._in(push), ._out(pulse_btn[0]));
    pulse_generator _btn1(.clk(clk), ._in(pop), ._out(pulse_btn[1]));


    stack_ctrl s0(.clk(clk),
        .din(sw),
        ._push(pulse_btn[0]),
        ._pop(pulse_btn[1]),
        .dout(ld),
        ._full(ld_full),
        ._empty(ld_empty),
        .stack_pointer()
    );
endmodule // task43_example_top
