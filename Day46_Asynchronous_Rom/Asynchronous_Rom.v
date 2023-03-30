module asynchronous_rom (
    input [2:0] address,
    output reg [15:0] data
);

reg [15:0] mem [0:7];

initial begin
    // initialize memory contents
    mem[0] = 16'h0001;
    mem[1] = 16'h0002;
    mem[2] = 16'h0003;
    mem[3] = 16'h0001;
    mem[4] = 16'h0002;
    mem[5] = 16'h0003;
    mem[6] = 16'h00FE;
    mem[7] = 16'h00FF;
end

always @(*) begin
    data = mem[address];
end

endmodule