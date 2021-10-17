module fulladder(n1, n2, cin, cout, sum);
    
    input wire n1;
    input wire n2;
    input wire cin;
    output wire cout;
    output wire sum;
 

assign sum = (n1 ^ n2) ^ cin;
assign cout= n1 & n2 | (n1 ^ n2) & cin;

    

endmodule

module test_fulladder;

  wire n1;
  wire n2;
  wire cin;
  wire sum;
  integer i;


  fulladder fa0 (.n1(n1),
                  .n2(n2),
                  .cin(cin),
                  .cout(cout),
                  .sum(sum));

  initial begin
    // Collect waveforms

    n1 <= 0;
    n2 <= 0;
    cin <= 0;
    
  for (i = 0; i < 2; i = i + 1) begin
    # 10 n1 <=$random;
        n2 <= $random;
        cin <= $random;

    end     
	end

endmodule
