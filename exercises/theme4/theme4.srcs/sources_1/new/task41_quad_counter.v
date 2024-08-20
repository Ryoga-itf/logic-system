// File: task41_quad_counter.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task41_quad_counter(clk, btn0, ld);
    input clk;
    input btn0;
    output [1:0]ld;

    // State
    localparam S_ZERO  = 2'b00;
    localparam S_ONE   = 2'b01;
    localparam S_TWO   = 2'b10;
    localparam S_THREE = 2'b11;

    reg [31:0] cnt;
    reg [1:0] state;
    wire pulse_btn0;
    pulse_generator _btn0(.clk(clk), ._in(btn0), ._out(pulse_btn0));

    initial begin
        state <= S_ZERO;
    end

    always@(posedge clk) begin
        if (state == S_ZERO && pulse_btn0) begin
            state <= S_ONE;
        end 
        else if (state == S_ONE && pulse_btn0) begin 
            state <= S_TWO;
        end    
        else if (state == S_TWO && pulse_btn0) begin 
            state <= S_THREE;
        end    
        else if (state == S_THREE && pulse_btn0) begin 
            state <= S_ZERO;
        end    
    end

    assign ld = state;
endmodule // task41_quad_counter
