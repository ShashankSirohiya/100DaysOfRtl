module tb_Comparator;
	reg [2:0]a;
	reg [2:0]b;
	wire [1:0]grth,lsth,eq,none;

	Comparator uut0(a,b,grth,lsth,eq,none);
		initial	begin
			a=0;
			b=0;
			#10;
		end

		always begin
			a=$random;
			b=$random;
			#50;
		end
endmodule : tb_Comparator
