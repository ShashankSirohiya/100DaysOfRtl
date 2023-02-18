module tb_parity_encoder;

	reg [15:0]x;
	wire y;

    parity_encoder dut0(.x(x),
	  			        .y(y));
	initial
	begin
		    x=0;
		    
		#10 x=16'b0000000000000001;
		
		#10 x=16'b0000000000001010;
		
		#10 x=16'b0000000000111100;

		#10 x=16'b0000000000001000;

		#10 x=16'b0000000101010000;

		#10 x=16'b0000000100100000;

		#10 x=16'b0000000001000000;
	end
endmodule