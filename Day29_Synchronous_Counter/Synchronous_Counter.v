
module sequence_counter(
    input clk,
    input reset,
    output reg [3:0] out
);

reg [2:0] count;

always @(posedge clk, posedge reset) begin
    if (reset) begin
        count <= 3'b000;
        out <= 4'b0000;
    end else begin
        case (count)
            3'b000: begin // 0
                out <= 4'b0000;
                count <= 3'b011;
            end
            3'b011: begin // 3
                out <= 4'b0011;
                count <= 3'b100;
            end
            3'b100: begin // 4
                out <= 4'b0100;
                count <= 3'b101;
            end
            3'b101: begin // 7
                out <= 4'b0111;
                count <= 3'b000;
            end
            default: count <= 3'b000; // should never happen
        endcase
    end
end

endmodule

