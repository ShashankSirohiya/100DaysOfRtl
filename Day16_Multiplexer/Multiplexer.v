
module Mux2_1(input [7:0]x,y,
			  input s,
			  output [7:0]z);
	assign z = s? y : x ;
endmodule : Mux2_1


module Mux4_1(input [7:0] A,B,C,D,
			  input s0,s1, 
   			  output [7:0]Y);
	assign Y = s1? (s0?D:C):(s1?B:A);
endmodule : Mux4_1


module Mux8_1(input [7:0]a,b,c,d,e,f,g,h,
			  input s2,s1,s0,
			  output [7:0]y);
			wire [7:0]w1,w2;

		Mux4_1 mo(a,b,c,d,s0,s1,w1);
		Mux4_1 m1(e,f,g,h,s0,s1,w2);
		Mux2_1 m2(w1,w2,s2,y);
endmodule : Mux8_1