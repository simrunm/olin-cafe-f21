// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state;

always_ff @(posedge clk) begin
  if(rst) begin
    out <= 0;
  end else begin
      if(out == 0) begin
          state = COUNTING_UP;
      end
      if (out == 2**(N - 1)) begin
          state = COUNTING_DOWN;
      end
      if (ena)begin
          if(state == COUNTING_UP) begin
              out <= out + 1;              
          end
          if(state == COUNTING_DOWN)begin
              out <= out - 1;
          end
      end

  end
end

endmodule