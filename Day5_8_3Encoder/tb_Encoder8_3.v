module tb_Encoder8_3;
	reg [7:0] IN;
	wire [2:0] out;

	Encoder8_3 uut (
		.IN(IN), 
		.out(out)
	);
	
	initial
	begin
			IN=8'b00000000;
		#10 IN=8'b10000000;
		#10 IN=8'b01000000;
		#10 IN=8'b00100000;
		#10 IN=8'b00010000;
		#10 IN=8'b00001000;
		#10 IN=8'b00000100;
		#10 IN=8'b00000010;
		#10 IN=8'b00000001;
		#10 IN=8'b00000000;
	end
      
endmodule
