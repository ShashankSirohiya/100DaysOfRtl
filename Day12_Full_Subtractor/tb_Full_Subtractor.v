module tb_full_subtractor;
	reg [3:0]a;
	reg [3:0]b;
	reg cin;
	reg choice;

	wire [3:0]result;
	wire cout;

  full_subtractor uut0(.a(a),.b(b),.cin(cin),.choice(choice),.result(result),.cout(cout));
 	initial begin
 		a=0;
 		b=0;
 		cin=0;
 		choice=0;
 		#100;
 	end

 	always begin
 		#100;
 		a=$random;
 		b=$random;
 		cin=$random;
 		choice=$random;
 	end
endmodule : tb_full_subtractor 

