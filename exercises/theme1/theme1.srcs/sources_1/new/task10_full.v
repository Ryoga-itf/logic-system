// File: task10_full.v
// Author: Ryoga <@Ryoga-exe>

module half_adder(
    input x,
    input y,
    output [1:0]q
);
    //q[0]: sum, q[1]: carry_out
    
    //sum
    assign q[0] = (x && !y)||(!x && y); 
    //carry
    assign q[1] = x && y;
    
endmodule // half_adder

module full_adder(
    input x,
    input y,
    input c,
    output [1:0]q 
);
    //q[0]: sum, q[1]: carry_out
    
    wire [1:0] w0;
    wire [1:0] w1;
    
    //sum
    half_adder c0(.x(x), .y(y), .q(w0));
    half_adder c1(.x(w0[0]), .y(c), .q(w1));
    // sum
    assign q[0] = w1[0];
    // carry
    assign q[1] = w0[1] || w1[1];
    
endmodule // full_adder

module task10_full(
    input sw0,
    input sw1,
    input sw2,
    output [1:0] ld
);
    
    full_adder c(.x(sw0), .y(sw1), .c(sw2), .q(ld));

endmodule // task10_full
