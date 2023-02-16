module tb_Decoder3_8 ;
	reg [2:0] i;
	wire [7:0] y;

	Decoder3_8 uut (
		.i(i), 
		.y(y));
	
	initial
	begin
		i=3'b000;
		#10;
	end

	always begin
		#10 i=3'b000;
		#10 i=3'b001;
		#10 i=3'b010;
		#10 i=3'b011;
		#10 i=3'b100;
		#10 i=3'b101;
		#10 i=3'b110;
		#10 i=3'b111;
	end
endmodule : tb_Decoder3_8
