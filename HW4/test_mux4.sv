module test_mux4;

  logic [4:0] d0, d1, d2, d3;
  logic [1:0] s;
  wire [4:0] y;

  mux4 UUT(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s), .y(y));

  initial begin
    $dumpvars(0, UUT);
    $dumpfile("mux4.vcd");

    $display("d0   |d1  |d2  |d3  |s |y");
    // testing three random cases

    for (int i = 0; i < 32; i = i + 1) begin 
      
      d0 = 5'b00000 + i;
      d1 = 5'b00001 + i;
      d2 = 5'b00010 + i;
      d3 = 5'b00011 + i;
      s = 2'b00 + i;
      #1 $display("%b|%b|%b|%b|%b|%b", d0, d1, d2, d3, s, y);
    end
  end

endmodule