module tb_freq_by2;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire q;
	wire qn;

	// Instantiate the Unit Under Test (UUT)
	freq_by2 uut (
		.clk(clk), 
		.q(q), 
		.qn(qn),
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset = 0;
        
		// Add stimulus here

	end
	
	always
	begin
	clk = ~clk;
	#20;
	end
      
endmodule