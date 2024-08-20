// File: task23_2.v
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

module task23_2(
    input clk,
    input btn0,
    input [3:0]sw,
    output [3:0]dout,
    output ld5
);

    reg we;
    wire pulse;

    pulse_generator c(.clk(clk), ._in(btn0), ._out(pulse));

    always@(posedge clk) begin
        if (pulse == 1) begin
            we <= ~we;
        end
    end

    if (we == 1) begin
        ram_task23 ram_inst(
            .addra(5'b00001),
            .clka(clk),
            .dina(sw),
            .douta(dout),
            .wea(1'b1)
        );
    end

    assign ld5 = we;

endmodule // task23_2
