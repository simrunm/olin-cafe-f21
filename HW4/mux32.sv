module mux32(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17,  
            d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, s, y);

    input wire [4:0] d0;
    input wire [4:0] d1;
    input wire [4:0] d2;
    input wire [4:0] d3;
    input wire [4:0] d4;
    input wire [4:0] d5;
    input wire [4:0] d6;
    input wire [4:0] d7;
    input wire [4:0] d8;
    input wire [4:0] d9;
    input wire [4:0] d10;    
    input wire [4:0] d11;
    input wire [4:0] d12;
    input wire [4:0] d13;
    input wire [4:0] d14;
    input wire [4:0] d15;
    input wire [4:0] d16;
    input wire [4:0] d17;
    input wire [4:0] d18;
    input wire [4:0] d19;
    input wire [4:0] d20;
    input wire [4:0] d21;
    input wire [4:0] d22;
    input wire [4:0] d23;    
    input wire [4:0] d24;
    input wire [4:0] d25;
    input wire [4:0] d26;
    input wire [4:0] d27;
    input wire [4:0] d28;
    input wire [4:0] d29;
    input wire [4:0] d30;
    input wire [4:0] d31;
    input wire [4:0] s;
    logic [4:0] i0;
    logic [4:0] i1;
    logic [4:0] i2;
    logic [4:0] i3;
    logic [4:0] i4;
    logic [4:0] i5;
    logic [4:0] i6;
    logic [4:0] i7;
    logic [4:0] i8;
    logic [4:0] i9;
    output logic [4:0] y;

    
    mux4 MUX0 (
    d0[4:0], d1[4:0], d2[4:0], d3[4:0], s[1:0], i0[4:0] 
    );

    mux4 MUX1 (
    d4[4:0], d5[4:0], d6[4:0], d7[4:0], s[1:0], i1[4:0] 
    );

    mux4 MUX2 (
    d8[4:0], d9[4:0], d10[4:0], d11[4:0], s[1:0], i2[4:0] 
    );

    mux4 MUX3 (
    d12[4:0], d13[4:0], d14[4:0], d15[4:0], s[1:0], i3[4:0] 
    );

    mux4 MUX4 (
    d16[4:0], d17[4:0], d18[4:0], d19[4:0], s[1:0], i4[4:0] 
    );

    mux4 MUX5 (
    d20[4:0], d21[4:0], d22[4:0], d23[4:0], s[1:0], i5[4:0] 
    );
    
    mux4 MUX6 (
    d24[4:0], d25[4:0], d26[4:0], d27[4:0], s[1:0], i6[4:0] 
    );

    mux4 MUX7 (
    d28[4:0], d29[4:0], d30[4:0], d31[4:0], s[1:0], i7[4:0] 
    );

    mux4 MUX8 (
    i0[4:0], i1[4:0], i2[4:0], i3[4:0], s[3:2], i8[4:0] 
    );

    mux4 MUX9 (
    i4[4:0], i5[4:0], i6[4:0], i7[4:0], s[3:2], i9[4:0] 
    );

    mux2 MUX10 (
    i8[4:0], i9[4:0], s[4], y[4:0] 
    );


endmodule