module pseudo_random_sequence(
    input clk,
    input rst_n,
    output [7:0] prbs
);

// Registers
reg [7:0] temp;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        temp <= 8'hFF;
    else 
        temp <= {temp[6:0], temp[7] ^ temp[2]};
end

assign prbs = temp;

endmodule
