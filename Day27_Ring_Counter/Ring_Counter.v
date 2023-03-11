module ring_counter(
    input clk,
    input reset,
    output reg [3:0] out
);

always @(posedge clk, posedge reset) begin
    if (reset) begin
        out <= 6'b000001;
    end else begin
        out <= {out[2:0], out[3]};
    end
end

endmodule



//out<={out[0],out[5:1]};