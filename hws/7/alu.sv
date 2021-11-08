`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"

module alu(a, b, control, result, overflow, zero, equal);
parameter N = 32; // Don't need to support other numbers, just using this as a constant.

input wire [N-1:0] a, b; // Inputs to the ALU.
input alu_control_t control; // Sets the current operation.
output logic [N-1:0] result; // Result of the selected operation.

output logic overflow; // Is high if the result of an ADD or SUB wraps around the 32 bit boundary.
output logic zero;  // Is high if the result is ever all zeros.
output logic equal; // is high if a == b.

wire c_out, c_in
wire [N-1:0] anded, ored, xored, sll, srl, sra, add, sub, slt, sltu;

// Use *only* structural logic and previously defined modules to implement an 
// ALU that can do all of operations defined in alu_types.sv's alu_op_code_t!

c_in = 4'b000
adder_n ADD (
    .a(a),
    .b(b),
    .c_in(4'b0000),
    .sum(add),
    .c_out(c_out)
);

logic [N-1:0] not_b;
always_comb not_b = ~b; 
adder_n #(.N(N)) SUBTRACTOR (
  .a(a), .b(not_b), .c_in(1'b1),
  .c_out(c_out), .sum(sub)
);

shift_right_logical #(.N(N) shiftR (
    .in(a), .shamt(b), .out(srl), 
);

shift_right_arithmetic #(.N(N) shiftR (
    .in(a), .shamt(b), .out(sra), 
);

shift_left_logical #(.N(N) shiftL (
    .in(b), .shamt(a), .out(sll), 
);

slt #(.N(N) SLT (
    .a(a), .b(b), .out(slt), 
);

sltu #(.N(N) SLTU (
    .a(a), .b(b), .out(sltu), 
);

always_comb begin
    anded = a & b;
    ored = a | b;
    xored = a ^ b;
    equal = ~ored; // check every bit and see if there is a one and then equal will be zero
    zero = // check if result has all 0s
    overflow = // check for overflow.


    
end
    
    
    

    






mux16 #(.N(N)) MUX_0 (
		.in0(), .in1(anded), .in2(ored), .in3(xored), .in4(in4), .in5(sll), .in6(srl), .in7(sra), 
		.in8(add), .in9(in9), .in10(in10), .in11(in11), .in12(sub), .in13(slt), .in14(in14), .in15(sltu),
		.switch(control), .out(result)
	);


endmodule