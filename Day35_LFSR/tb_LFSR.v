module lfsr_tb;

reg clk;
reg reset;
wire [7:0] seq_out;

lfsr dut(
    .clk(clk),
    .reset(reset),
    .seq_out(seq_out)
);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $finish;
end

always #5 clk = ~clk;

endmodule