module test_edge_detector;


input logic clk, rst, in;
output wire positive_edge, negative_edge, positive_edge_moore, negative_edge_moore;

edge_detector UUT_MEALY (clk, rst, in, positive_edge, negative_edge);
edge_detector_moore UUT_MOORE (clk, rst, in, positive_edge_moore, negative_edge_moore);

initial begin
    clk = 0;
    rst = 1;
    in = 0;
    $dumpfile("edge_detector.vcd");
    $dumpfile(0,UUT_MEALY);
    $dumpfile(0,UUT_MOORE);

    repeat(2) @(negedge clk);
    rst = 0; 

    for(int i = 0; i < 10; i = i + 1) begin
        delay = $random;
        repeat (delay) @(negedge clk);
        in = ~in;     
    end

    $finish;
end
endmodule