module pseudo_random_sequence_tb;

// Inputs
reg clk;
reg rst_n;

// Outputs
wire [7:0] prbs;

// Instantiate DUT
pseudo_random_sequence dut (
    .clk(clk),
    .rst_n(rst_n),
    .prbs(prbs)
);

// Reset
initial begin
    clk = 1'b0;
    rst_n = 1'b0;
    #10;
    rst_n = 1'b1;
end

// Clock generator
always #5 clk = ~clk;

endmodule
