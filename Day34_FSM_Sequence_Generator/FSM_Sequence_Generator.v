module seq_gen(
    input clk,
    input reset,
    output reg [7:0] seq_out
);

reg [2:0] state;

always @(posedge clk) begin
    if (reset) begin
        state <= 0;
        seq_out <= 0;
    end
    else begin
        case (state)
            3'd0: begin
                seq_out <= 8'b00000001;
                state <= 3'd1;
            end
            3'd1: begin
                seq_out <= 8'b00000010;
                state <= 3'd2;
            end
            3'd2: begin
                seq_out <= 8'b00000100;
                state <= 3'd3;
            end
            3'd3: begin
                seq_out <= 8'b00001000;
                state <= 3'd0;
            end
        endcase
    end
end

endmodule
