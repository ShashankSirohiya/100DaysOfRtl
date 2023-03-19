module lfsr(
    input clk,
    input reset,
    output reg [7:0] seq_out
);

reg [7:0] state;

always @(posedge clk) begin
    if (reset) begin
        state <= 8'b00000001;
        seq_out <= 8'b00000001;
    end
    else begin
        state <= {state[6:0], state[7]^state[2]};
        seq_out <= state;
    end
end

endmodule