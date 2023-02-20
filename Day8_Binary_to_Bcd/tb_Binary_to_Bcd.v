module tb_binary_to_bcd;
		reg [7:0]IN;
		wire[3:0] bcd0,bcd1,bcd2;

binary_to_bcd uut0(.IN(IN),.bcd0(bcd0),.bcd1(bcd1),.bcd2(bcd2));

	initial begin
		IN=8'b00;
		#100;
	end

	always begin
		#100;
		IN=210;
		#100;
		IN=250;
		#100;
		IN=252;
		#100;
		IN=255;
	end
endmodule : tb_binary_to_bcd