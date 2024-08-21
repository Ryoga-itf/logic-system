// File: task43_5_2.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task43_5_2(clk, sw, push, pop, ld_full, ld_empty, seg, sel_out);
    `include "parameters_task43_x_2.v"

    input clk;
    input [IO_SW_WIDTH-1:0] sw;
    input push;
    input pop;
    output ld_full;
    output ld_empty;
    output [6:0]seg;
    output sel_out;

    wire [2:0] pulse_btn;

    wire [IO_WIDTH-1:0] value;
    reg [2:0] pop_w;
    reg [2:0] pop_btn;
    reg push_result_w;
    reg push_w;

    pulse_generator _btn0(.clk(clk), ._in(push), ._out(pulse_btn[0]));
    pulse_generator _btn1(.clk(clk), ._in(pop), ._out(pulse_btn[1]));


    stack_ctrl_x_2 s0(.clk(clk),
        .din(push_result_w ? result : { 4'b0000, sw }),
        ._push(pulse_btn[0] || push_result_w),
        ._pop(pop_btn > 1),
        .dout(value),
        ._full(ld_full),
        ._empty(ld_empty),
        .stack_pointer()
    );

    localparam N = 2;
    reg [IO_WIDTH-1:0] opr[0:N-1];
    reg [IO_WIDTH-1:0] result;
    
    initial begin
        opr[0] <= 0;
        opr[1] <= 0;
        pop_w <= 0;
        pop_btn <= 0;
        push_result_w <= 0;
        push_w <= 0;
        result <= 0;
    end

    always@(posedge clk) begin
        if (push_result_w) begin
            push_result_w <= 0;
        end

        if (pop_btn > 0) begin
            pop_btn <= pop_btn - 1;
        end

        if (pulse_btn[1]) begin
            pop_btn <= 3;
        end

        if (pop_w == 0) begin
            if (pop_btn == 1) begin
                opr[0] <= value;
                opr[1] <= opr[0];
                pop_w <= 1;
            end
        end else begin
            pop_w <= pop_w + 1;
            if (pop_w == 2) begin
                opr[0] <= value;
                opr[1] <= opr[0];
                pop_w <= 0;
                push_w <= 1;
            end
        end

        if (push_w) begin
            result <= opr[1] + opr[0];
            push_result_w <= 1;
            push_w <= 0;
        end
    end

    localparam MAX_COUNTER = 10000;
    reg [31:0]seven_seg_counter;
    reg seven_seg_switcher;

    initial begin
        seven_seg_counter <= 0;
        seven_seg_switcher <= 0;
    end

    always@(posedge clk) begin
        if (seven_seg_counter == MAX_COUNTER) begin
            seven_seg_switcher <= ~seven_seg_switcher;
            seven_seg_counter <= 0;
        end else begin
            seven_seg_counter <= seven_seg_counter + 1;
        end
    end

    seven_seg(.din(seven_seg_switcher ? result[7:4] : result[3:0]), .sel_in(seven_seg_switcher), .seg(seg), .sel_out(sel_out));

endmodule // task43_5_2
