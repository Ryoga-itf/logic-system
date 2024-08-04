// File: task21_ex0.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module task21_ex0(
    input clk,
    output [3:0]ld
);
    reg [3:0]sreg;
    
    initial begin
        sreg <= 4'b0001;
    end

    always@(posedge clk) begin
        sreg[3] <= sreg[2];
        sreg[2] <= sreg[1];
        sreg[1] <= sreg[0];
        sreg[0] <= sreg[3];
    end

    assign ld = sreg;
endmodule // task21_ex0
