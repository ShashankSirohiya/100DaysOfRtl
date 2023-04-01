module alu_decoder_rom_tb;

reg [3:0] alu_opcode;
wire [7:0] control_signals;

alu_decoder_rom dut (
    .alu_opcode(alu_opcode),
    .control_signals(control_signals)
);

initial begin
    // test some opcodes
    alu_opcode = 4'b0000;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    alu_opcode = 4'b0010;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    alu_opcode = 4'b1111;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    alu_opcode = 4'b0001;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    alu_opcode = 4'b0011;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    alu_opcode = 4'b0100;
    #10;
    $display("Control signals for opcode %b is %b", alu_opcode, control_signals);

    $display("All tests completed.");
    $finish;
end

endmodule