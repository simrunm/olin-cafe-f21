module test_register_file;

input logic clk;
//write
input logic wr_ena
input logic [4:0] wr_addr, rd_addr0, rd_addr1;
input logic [31:0] wr_data;
// read
input logic [4:0] rd_addr0, rd_addr1;
output wire [31:0] rd_data0, rd_data1;


register_file UUT(
    .clk(clk), .wrt_ena(wr_ena), .wr_addr(wr_addr), .rd_addr0(rd_addr0)
    .rd_addr1(rd_addr1), .wr_data(wr_data), .rd_data0(rd_data0), .rd_data1(rd_data1)
);
    
intial begin
    // set all inputs to default value
    clk = 0;
    wr_ena = 0;
    wr_addr = 0;
    wr_data = 0;
    rd_addr0 = 0;
    rd_addr1 = 0;

    @(negedge clk);
    rd_addr0 = 0;
    rd_addr1 = 0;
    @(posedge clk);
    $display ("@%t: read0[%02d] = %x", $time, rd_addr0, rd_data0, rd_addr0, rd_addr1)
end

endmodule