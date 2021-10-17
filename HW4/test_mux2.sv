module test_mux2;

logic [4:0] d0, d1;
logic s;
wire [4:0] y;

mux2 UUT(.d0(d0), .d1(d1), .s(s), .y(y));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux2.vcd");

  $display("d0   |d1   |s |y");
  // testing three random cases
    d0 = 5'b00000;
    d1 = 5'b00001;
    s = 1'b1;
    #1 $display("%b|%b|%b | %b", d0, d1, s, y);

    d0 = 5'b00010;
    d1 = 5'b00011;
    s = 1'b0;
    #1 $display("%b|%b|%b | %b", d0, d1, s, y);

    d0 = 5'b00110;
    d1 = 5'b01000;
    s = 1'b0;
    #1 $display("%b|%b|%b | %b", d0, d1, s, y);
  // end
end



endmodule