
module tb_Mux8_1;
	reg[7:0] i0,i1,i2,i3,i4,i5,i6,i7;
	reg s0,s1,s2;
	wire[7:0]y; 
	
	Mux8_1 uut (
		.a(i0), 
		.b(i1), 
		.c(i2), 
		.d(i3), 
		.e(i4),
		.f(i5),
		.g(i6),
		.h(i7), 
		.s0(s0), 
		.s1(s1),
		.s2(s2), 
		.y(y) );

	initial 
	begin
		// Initialize Inputs
		i0 = 0;
		i1 = 0;
		i2 = 0;
		i3 = 0;
		i4 = 0;
		i5 = 0;
		i6 = 0;
		i7 = 0;
		s0 = 0;
		s1 = 0;
		s2 = 0;
		// Wait 100 ns for global reset to finish
		#10;	
	end
	
	always
	begin
	#10 i0=$random;
		i1=$random;
		i2=$random;
		i3=$random;
		i4=$random;
		i5=$random;
		i6=$random;
		i7=$random;
		s0=$random;
		s1=$random;
		s2=$random;
		$display("s2=%d,s1=%d,s0=%d",s2,s1,s0);
	end
endmodule :tb_Mux8_1
