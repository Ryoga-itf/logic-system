// File: task43.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task43(clk, sw, push, pop, add, ld, ld_full, ld_empty);
    `include "parameters_task43.v"

    input clk;
    input [IO_WIDTH-1:0] sw;
    input push;
    input pop;
    input add;
    output reg [IO_WIDTH-1:0] ld;
    output ld_full;
    output ld_empty;

    wire [2:0] pulse_btn;

    wire [IO_WIDTH-1:0] value;
    reg [2:0]pop_data_timer;

    pulse_generator _btn0(.clk(clk), ._in(push), ._out(pulse_btn[0]));
    pulse_generator _btn1(.clk(clk), ._in(pop), ._out(pulse_btn[1]));
    pulse_generator _btn2(.clk(clk), ._in(add), ._out(pulse_btn[2]));


    stack_ctrl s0(.clk(clk),
        .din(sw),
        ._push(pulse_btn[0]),
        ._pop(pulse_btn[1]),
        .dout(value),
        ._full(ld_full),
        ._empty(ld_empty),
        .stack_pointer()
    );

    localparam N = 2;
    reg [IO_WIDTH-1:0] opr[0:N-1];
    
    initial begin
        opr[0] <= 0;
        opr[1] <= 0;
        pop_data_timer <= 0;
    end

    always@(posedge clk) begin
        if (pop_data_timer == 0) begin
            if (pulse_btn[1]) begin
                pop_data_timer <= 1;
            end
        end else begin
            pop_data_timer <= pop_data_timer + 1;
            if (pop_data_timer == 2) begin
                opr[0] <= value;
                opr[1] <= opr[0];
                pop_data_timer <= 0;
            end
        end

        if (pulse_btn[2]) begin
            ld <= opr[1] + opr[0];
        end
    end
endmodule // task43
