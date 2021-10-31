module edge_detector(clk, rst, button, pressed);
    
    input wire clk, rst;
    input wire button;
    output logic pressed


    always_ff @(posedge clk) begin : edge_detector 
        pressed = button & ~pressed
    end



endmodule