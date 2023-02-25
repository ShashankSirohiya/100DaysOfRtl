module tb_Multiplier;
	reg [3:0]a,b;
	wire [7:0]out;

	//wire[7:0]t1,t2,t3,t4;

Multiplier uut0(.a(a),.b(b),.out(out));
		initial begin
			a=4'b0;
			b=4'b0;
			#100;
		end

		always begin
			#100;
			a=$random;
			b=$random;
		end
endmodule : tb_Multiplier
