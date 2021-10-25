module test_debouncer(clk, rst, bounce_in, debounce_out);

logic clk, rst;
logic bounce_in;

wire debounce_out;

debouncer #(.BOUNCE_TICKS(100)) UUT(
    .clk(clk), .rst(rst), .bounce_in(bounce_in), .debounce_out(debounce_out)
);

int bounces, delay;
always #(CLK_PERIOD_NS/2) clk = ~clk;

initial begin
    $dumpfile("debouncer.vcd");
    $dumpvars(0,UUT);

    // Inititalize all variables
    clk = 0;
    rst = 1;
    bounce_in = 0;
        
    repeat (2) @(negedge clk);
    rst = 0; 
    
    bounces = ($urandom % 20);
    for(int i = 0; i < bounces; i = i + 1) begin
        delay = ($urandom % 15) + 1;
        #(delay) bounce_in = $urandom;        
    end

    repeat(10) @(posedge clk);

    $finish;      

end
    
endmodule