module mux4(d0, d1, d2, d3, s, y);

    input wire [4:0] d0;
    input wire [4:0] d1;
    input wire [4:0] d2;
    input wire [4:0] d3;
    input wire [1:0] s;
    logic [4:0] y1;
    logic  [4:0] y2;
    output logic [4:0] y;

    always_comb begin
        y1 = s[0] ? d3 : d2;
        y2 = s[0] ? d1 : d0;
        y = s[1] ? y1 : y2;
    end
endmodule