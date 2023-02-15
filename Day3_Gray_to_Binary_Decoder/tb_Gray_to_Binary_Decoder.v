module tb_Gray_to_Binary_Decoder;

	// Inputs
	reg [2:0]G;

	// Outputs
	wire [2:0]B;

 // Instantiate the Unit Under Test (UUT)
 Gray_to_Binary_Decoder uut(.G(G),.B(B));

	initial begin
		// Initialize Inputs
		    G=3'b000;
		// Wait 10 ns for global reset to finish
	
		#5; G=3'b001;

		#5; G=3'b010;
		
		#5; G=3'b011;
		
		#5; G=3'b100;
		
		#5; G=3'b101;

		#5; G=3'b110;

		#5; G=3'b111;

		$strobe("G=%d B=%d",G,B);
	end		 
endmodule : tb_Gray_to_Binary_Decoder