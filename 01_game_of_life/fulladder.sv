module fulladder(n1, n2, cin, cout, sum);
    
    input wire n1;
    input wire n2;
    input wire cin;
    output wire cout;
    output wire sum;
 

assign sum = (n1 ^ n2) ^ cin;
assign cout= n1 & n2 | (n1 ^ n2) & cin;

    

endmodule