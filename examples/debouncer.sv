module debouncer(clk, rst, bounce_in, debounce_out);

input wire clk, rst;
input wire bounce_in;
output logic debounce_out;

always_comb debounce_out  <= 1'bx; // just for debugging



endmodule