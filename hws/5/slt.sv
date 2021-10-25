module slt(a, b, out);
    parameter N = 32;
    input wire signed [N-1:0] a, b;
    wire signed [N-1:0] inv;
    wire signed c_out;
    wire signed c_in;
    output logic [N-1:0] diff;
    output logic out;

    assign c_in = 0;
    invert_32 INVERT (
        b[N-1:0], inv[N-1:0],c_out
        );

    adder_32 ADDER (
        a[N-1:0],inv[N-1:0], c_in, diff[N-1:0], c_out
        );

    assign out = diff[N-1];

endmodule