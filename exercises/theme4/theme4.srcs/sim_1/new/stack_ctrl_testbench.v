// File: stack_ctrl_testbench.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module stack_ctrl_testbench ();
    `include "../../sources_1/new/parameters_task43.v"

    reg clk;
    reg [IO_WIDTH-1:0] din;
    reg push;
    reg pop; 
    wire [IO_WIDTH-1:0] dout;
    wire full;
    wire empty;
    wire [4:0] stack_pointer;

    wire push_w,pop_w;

    parameter CLK_PERIOD = 10.0;
    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        clk = 0;
        push = 0;
        pop = 0;
        #  55 din <= 4'b1010;
        # 100 push <= 1;
        # 100 push <= 0;
    //    # 100 din <= 4'b0010;
    //    # 200 push <= 1;
    //    # 100 push <= 0;
        # 500 pop <= 1;
        # 100 pop <= 0;
    //    # 100 pop <= 1;
    //    # 100 pop <= 0;
        //# 55  din <= 4'b0011;
        //# 100 push <= 1;
        //# 100 push <= 0;
    end

    pulse_generator _btn0(.clk(clk), ._in(push), ._out(push_w));
    pulse_generator _btn1(.clk(clk), ._in(pop), ._out(pop_w));
    stack_ctrl s0(
        .clk(clk),
        .din(din),
        ._push(push_w),
        ._pop(pop_w),
        .dout(dout),
        ._full(full),
        ._empty(empty),
        .stack_pointer(stack_pointer)
    );
endmodule // stack_ctrl_testbench
