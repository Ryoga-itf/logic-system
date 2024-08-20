// File: task23_ex0_testbench.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns/1ps

module task23_ex0_testbench();
    reg _clk;    
    reg [3:0]_din;
    wire [3:0]_dout;

    parameter CLK_PERIOD = 10.0;

    always #(CLK_PERIOD/2) _clk <= ~_clk;

    initial begin
        _clk <= 0;
        #50 _din <= 4'b0101;         
    end

    task23_ex0 inst(
        .clk(_clk),
        .din(_din),
        .dout(_dout)
    );
endmodule // task23_ex0_testbench
