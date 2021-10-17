module mux2(d0, d1, s, y);

    input wire [4:0] d0;
    input wire [4:0] d1;
    input wire s;
    output logic [4:0] y;
    
    always_comb begin
        y = s ? d1:d0;

    end
endmodule