module SRAM_tb;

	// Parameters
	parameter ADDR_WIDTH = 4;
	parameter DATA_WIDTH = 16;
	parameter DEPTH = 16;
	 
	// Inputs
	reg clk;
	reg [ADDR_WIDTH-1:0] addr;
	reg [DATA_WIDTH-1:0] data_in;
	reg cs;
	reg we;
	reg oe;
	
	// Outputs
	wire [DATA_WIDTH-1:0] data_out;
	
	// Instantiate the SRAM module
	SRAM dut(
		.clk(clk),
		.addr(addr),
		.data_in(data_in),
		.cs(cs),
		.we(we),
		.oe(oe),
		.data_out(data_out)
	);
	
	// Clock generation
	always #5 clk = ~clk;
	
	// Testbench code
	initial begin
		// Initialize inputs
		clk = 0;
		addr = 0;
		data_in = 16'h0000;
		cs = 0;
		we = 0;
		oe = 0;
		#10;

		// Write data to memory
		cs = 1;
		we = 1;
		oe =0;
		data_in = 16'h1234;
		addr = 4'h0;
		#10;
		
		cs = 1;
		we = 0;
		oe = 1;
		//data_in = 16'h5678;
		addr = 4'h0;
		#10;

		cs = 1;
		we = 1;
		oe = 0;
		data_in = 16'h9abc;
		addr = 4'h2;
		#10;
		
		cs = 1;
		we = 0;
		oe = 1;
		addr = 4'h2;
		#10;
		if (data_out !== 16'h1234) $display("got %h", data_out);
				
		addr = 4'h2;
		#10;
		if (data_out !== 16'h9abc) $display("got %h", data_out);
		
		cs = 1;
		we =1;
		// End of test
		$display("SRAM test complete.");
		//$finish;
	end

endmodule