module tb_Bcd_to_7segment;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	Bcd_to_7segment uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D));

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		#100;
	end

	always begin
		#100;
		A=$random;
		B=$random;
		C=$random;
		D=$random;
	end     
endmodule : tb_Bcd_to_7segment