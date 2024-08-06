// File: mult2.v
// Author: Ryoga <@Ryoga-exe>

module add2 (
  input  wire [3:0] a,
  input  wire [3:0] b,
  output wire [4:0] sum
);
  assign sum = a + b;
endmodule // add2

module mult2 (
  input  wire [3:0] a,
  input  wire [3:0] b,
  output wire [7:0] mult
);

  wire [3:0] p0, p1, p2, p3;
  wire [4:0] sum0, sum1, sum2, sum3;

  assign p0 = b[0] ? a : 0;
  assign p1 = b[1] ? a : 0;
  assign p2 = b[2] ? a : 0;
  assign p3 = b[3] ? a : 0;
  
  add2 c0(.a(0), .b(p0), .sum(sum0));
  add2 c1(.a(sum0[4:1]), .b(p1), .sum(sum1));
  add2 c2(.a(sum1[4:1]), .b(p2), .sum(sum2));
  add2 c3(.a(sum2[4:1]), .b(p3), .sum(sum3));

  assign mult = { sum3, sum2[0], sum1[0], sum0[0] };
  
endmodule // mult2
