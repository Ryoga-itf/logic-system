// File: task22_2.v
// Author: Ryoga <@Ryoga-exe>

`timescale 1ns / 1ps

module pulse_generator(clk, _in, _out);
    localparam SAMPLING_PERIOD = 1250000-1; // for implementation
    // localparam SAMPLING_PERIOD = 10; // for simulation

    input clk;
    input _in;
    output _out;

    reg [1:0]r;
    reg [31:0]cnt;

    always@(posedge clk) begin
        if (cnt < SAMPLING_PERIOD) cnt <= cnt + 1;
        else cnt <= 0;
        if (cnt == SAMPLING_PERIOD)r[0] <= _in;
        r[1] <= r[0];
    end

    assign _out = r[1] & ~r[0];
endmodule

module task22_2(
    input clk,
    input btn0,
    output [3:0] ld
);
    reg [3:0] hexcnt;
    reg [31:0] scnt;
    reg en;
    wire pulse;

    parameter SMAX = 125000000 - 1;

    initial begin
        hexcnt <= 0;
        scnt <= 0;
        en <= 0;
    end

    pulse_generator c(.clk(clk), ._in(btn0), ._out(pulse));

    always@(posedge clk) begin
        if (pulse == 1) begin
            en <= ~en;
        end
    end
    always@(posedge clk) begin
        if (scnt < SMAX) begin
            scnt <= scnt + 1;
        end else begin
            scnt <= 0;
        end
    end
    always@(posedge clk) begin
        if (scnt == SMAX) begin
            if (en == 1) begin
                hexcnt <= hexcnt + 1;
            end
        end
    end

    assign ld = hexcnt;
endmodule // task22_2
