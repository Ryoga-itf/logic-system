// File: task10_half.v
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

module task10_half(
    input sw0,
    input sw1,
    output [1:0] ld
);
    
    half_adder c(.x(sw0), .y(sw1), .q(ld));

endmodule // task10_half
