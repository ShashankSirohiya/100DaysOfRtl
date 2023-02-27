module Comparator(input [2:0]a,
				  input [2:0]b,
				  output reg [1:0] grth,lsth,eq,none);

	always@(a,b)
	begin
		grth=0;lsth=0;eq=0;none=0;	
		if (a==b)
			  eq=2'b01;
		else if (a>b)
			grth=2'b01;
		else if (a<b)
			lsth=2'b01;
		else
			none=2'b01;
	end
	
endmodule : Comparator

