module alu_decoder_rom (
    input [3:0] alu_opcode,
    output reg [7:0] control_signals
);

reg [7:0] mem [0:15];

initial begin
    // initialize memory contents
    mem[0] = 8'b00000001; // add
    mem[1] = 8'b00000101; // subtract
    mem[2] = 8'b00001001; // bitwise AND
    mem[3] = 8'b00001101; // bitwise OR
    mem[4] = 8'b00010001; // bitwise XOR
    mem[5] = 8'b00010101; // bitwise complement
    mem[6] = 8'b00011001; // shift left logical
    mem[7] = 8'b00011101; // shift right logical
    mem[8] = 8'b00100001; // rotate left
    mem[9] = 8'b00100101; // rotate right
    mem[10] = 8'b00101001; // load immediate
    mem[11] = 8'b00101101; // load register
    mem[12] = 8'b00110001; // store register
    mem[13] = 8'b00110101; // branch
    mem[14] = 8'b11111001; // jump
    mem[15] = 8'b11111101; // branch if equal
end

always @(*) begin
    control_signals = mem[alu_opcode];
end

endmodule