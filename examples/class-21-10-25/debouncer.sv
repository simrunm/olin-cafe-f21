module debouncer(clk, rst, bouncy_in, debounced_out);
parameter BOUNCE_TICKS = 10;
input wire clk, rst;
input wire bouncy_in;
output logic debounced_out;

enum logic [1:0]{
    S_0,
    S_MAYBE_1,
    S_1,
    S_MAYBE_0
} state;

logic [$clog2(BOUNCE_TICKS):0] counter; // ceiling (log base 2) - how many bits do i need

always_comb begin
    case(state)
    S_0,S_MAYBE_1: begin
        debounced_out = 0;
    end
    S_1, S_MAYBE_0: begin
        debounced_out = 1;
    end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= S_0
    end else begin
        case(state)
        S_0:begin
            if(bouncy_in) begin
                counter <= 0;
                state <= S_MAYBE_1;
            end
        end

        S_MAYBE_0:begin
            counter <= counter + 1;
            if (counter == (BOUNCE_TICKS - 1)) begin
                state <= S_1;
            end else begin
                state <= S_0;
            end 
            
        end

        S_MAYBE_1:begin
            counter <= counter + 1;
            if (counter == (BOUNCE_TICKS - 1)) begin
                state <= S_1;
            end else begin
                state <= S_0;
            end            
        end

        S_1:begin
            if(~ bouncy_in) begin
                counter <= 0;
                state <= S_MAYBE_0;
            end            
        end
        endcase    
    end    
end








// always_ff @(posedge clk) begin
//     if (bouncy_in == 1) begin
//         counter <= counter + 1        
//     end
//     if ( bouncy_in == 0)begin
//         counter <= 0
//     end
//     if (counter >= threshold)begin
//         debounced_out <= 1
//     else
//         debounced_out <= 0 
//     end
    
// end

endmodule