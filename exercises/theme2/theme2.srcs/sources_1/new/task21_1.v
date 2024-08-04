// File: task21_1.v
// Author: Ryoga <@Ryoga-exe>
`timescale 1ns / 1ps

module task21_1(
    input clk,
    output [3:0]ld
);
    reg [3:0]sreg;
    reg [31:0]upcnt;

    parameter UMAX = 125000000 - 1;
    
    initial begin
        sreg <= 4'b0001;
        upcnt <= 0;
    end

    always@(posedge clk) begin
        if (upcnt < UMAX) begin
            upcnt <= upcnt + 1;
        end else begin
            upcnt <= 0;
        end
    end

    always@(posedge clk) begin
        if (upcnt == UMAX) begin
            sreg[0] <= sreg[1];
            sreg[1] <= sreg[2];
            sreg[2] <= sreg[3];
            sreg[3] <= sreg[0];
        end
    end

    assign ld = sreg;
endmodule // task21_1
