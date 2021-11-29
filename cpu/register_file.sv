module register_file(clk, 
wr_ena, wr_addr, wr_data, 
rd_addr0, rd_data0,
rd_addr1, rd_data1
);


input wire clk;
//write
input wire wr_ena
input wire [4:0] wr_addr, rd_addr0, rd_addr1;
input wire [31:0] wr_data;
// read
input wire [4:0] rd_addr0, rd_addr1;
output wire [31:0] rd_data0, rd_data1;

logic [31:0] x00;
always_comb x00 = 32'd0;

logic [31:0] x01, x02, x03, x04, x05, x06, x07, x08, x09, x10,
            x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, 
            x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;

            




endmodule