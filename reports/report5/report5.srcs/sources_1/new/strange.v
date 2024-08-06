// File: strange.v
// Author: Ryoga <@Ryoga-exe>

module strange(
    input  wire       clk,
    input  wire       res,
    input  wire [1:0] s,
    output reg  [1:0] state
);
    
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;
    
    always@(posedge clk or posedge res) begin
        if (res) state <= S0;
        else begin
            if (state == S0) begin
                if (s == 0) begin
                    state <= S0;
                end else if (s == 1) begin
                    state <= S1;
                end else if (s == 2 || s == 3) begin
                    state <= S2;
                end
            end else if (state == S1) begin
                if (s == 0) begin
                    state <= S1;
                end else if (s == 1 || s == 2) begin
                    state <= S2;
                end else if (s == 3) begin
                    state <= S3;
                end
            end else if (state == S2) begin
                if (s == 0) begin
                    state <= S2;
                end else begin
                    state <= S3;
                end
            end else if (state == S3) begin
                state <= S0;
            end
        end
    end
endmodule // strange
