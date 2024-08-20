// File: task23_3.v
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
endmodule // pulse_generator

module task23_3(
    input clk,
    input btn0,
    output [3:0]dout
);

    reg [3:0]d;
    wire pulse;

    pulse_generator c(.clk(clk), ._in(btn0), ._out(pulse));

    always@(posedge clk) begin
        if (pulse == 1) begin
            d <= dout + 1;
        end
    end

    ram_task23 ram_inst(
        .addra(5'b00001),
        .clka(clk),
        .dina(d),
        .douta(dout),
        .wea(1'b1)
    );

endmodule // task23_3
