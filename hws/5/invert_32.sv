module invert_32(a, neg, c_out);

parameter N = 32;

input  wire [N-1:0] a;
wire [N-1:0] b;
output logic [N-1:0] neg;
output wire c_out;


wire [N:0] carries;
assign carries[0] = 0;
assign c_out = carries[N];
assign b = 32'd1;
assign a[N-1:0] = ~a[N-1:0];

adder_32 ADDER (
    a[N-1:0],b[N-1:0], c_in, neg[N-1:0], c_out
    );

endmodule
