// File: task43_testbench.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task43_testbench();
    `include "../../sources_1/new/parameters_task43.v"

    reg clk;
    reg [IO_WIDTH-1:0] sw;
    reg push;
    reg pop;
    wire [IO_WIDTH-1:0] ld;
    wire ld_full;
    wire ld_empty;

    parameter CLK_PERIOD = 10.0;
    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        clk <= 0;
        push <= 0;
        pop <= 0;
        #  55 sw <= 4'b1010;
        # 100 push <= 1;
        # 100 push <= 0;
        # 500 pop <= 1;
        # 100 pop <= 0;
    end

    task43_example_top inst(
        .clk(clk),
        .sw(sw),
        .push(push),
        .pop(pop),
        .ld(ld),
        .ld_full(ld_full),
        .ld_empty(ld_empty)
    );
endmodule // task43_testbench
