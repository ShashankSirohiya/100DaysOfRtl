module tb_Binary_to_Gray_Decoder ;

	// Inputs
	reg [2:0] t_B;

	// Outputs
	wire [2:0] t_G;

	// Instantiate the Unit Under Test (UUT)
	Binary_to_Gray_Decoder uut(.B(t_B), 
							   .G(t_G)
							    	);
	initial begin
		// Initialize Inputs
		t_B = 0;

		#5; t_B=3'b000;

		#5; t_B=3'b001;

		#5; t_B=3'b010;
		
		#5; t_B=3'b011;
		
		#5; t_B=3'b100;
		
		#5; t_B=3'b101;

		#5; t_B=3'b110;

		#5; t_B=3'b111;
	end
      
endmodule : tb_Binary_to_Gray_Decoder
