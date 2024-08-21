// File: stack_ctrl_x_2.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module stack_ctrl_x_2(clk, din, _push, _pop, dout, _full, _empty, stack_pointer);
    `include "parameters_task43_x_2.v"

    localparam LOGICAL_STACK_DEPTH = 8;

    input clk;
    input [IO_WIDTH-1:0] din;
    input _push;
    input _pop;
    output [IO_WIDTH-1:0] dout;
    output _full;
    output _empty;
    output [4:0] stack_pointer;
    reg [4:0] stack_pointer;

    wire push_w, pop_w;
    assign pop_w = _pop;
    assign push_w = _push;

    wire [MEM_WIDTH-1:0] douta_w;

    ram_task43_x_2 ram_inst( 
        .clka(clk),
        .addra(stack_pointer),
        .dina(din),
        .douta(douta_w),
        .wea(push_w & (stack_pointer < LOGICAL_STACK_DEPTH))
    );

    assign dout = douta_w;

    assign _full = (stack_pointer == LOGICAL_STACK_DEPTH) ? 1 : 0;
    assign _empty = (stack_pointer == 0 ) ? 1 : 0;

    initial begin
        stack_pointer <= 0;
    end

    always@(posedge clk) begin
        //push
        if (push_w && stack_pointer < LOGICAL_STACK_DEPTH) begin
            stack_pointer <= stack_pointer + 1;
        end
        //pop
        if (pop_w && stack_pointer > 0) begin
            stack_pointer <= stack_pointer - 1;  
        end    
    end
endmodule // stack_ctrl
