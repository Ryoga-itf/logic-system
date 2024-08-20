// File: task42.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task42(clk, sw, btn, ld);
    localparam N = 2;

    localparam S_WAIT  = 2'b00;
    localparam S_READY = 2'b01;
    localparam S_ADD   = 2'b10;

    input clk;
    input [3:0] sw;
    input [1:0] btn;
    output reg [3:0] ld;

    reg [1:0] state;
    reg [3:0] opr[0:N-1];
    reg [1:0] opr_cnt;
    wire[1:0] pulse_btn;

    pulse_generator _btn0(.clk(clk), ._in(btn[0]), ._out(pulse_btn[0]));
    pulse_generator _btn1(.clk(clk), ._in(btn[1]), ._out(pulse_btn[1]));

    initial begin
        state <= S_WAIT;
        opr[0] <= 0;
        opr[1] <= 0;
        opr_cnt <= 0;
    end

    always@(posedge clk) begin
        if (state == S_WAIT) begin
            if (pulse_btn[0]) begin
                opr[0] <= sw;
                opr[1] <= opr[0];
                opr_cnt <= opr_cnt + 1;
            end
            if (opr_cnt == 2) begin
                state <= S_READY;
            end
        end else if (state == S_READY) begin
            if (pulse_btn[1]) begin
                state = S_ADD;
            end
        end else if (state == S_ADD) begin
            ld <= opr[0] + opr[1];
            opr[0] <= 0;
            opr[1] <= 0;
            opr_cnt <= 0;
            state = S_WAIT;
        end
    end
endmodule // task42
