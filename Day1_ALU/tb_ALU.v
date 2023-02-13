module tb_ALU;
	reg [7:0]d0;
	reg [7:0]d1;
	reg [3:0]sel;
	wire [8:0]result;

 ALU dut (
 		.result(result),
		.d0(d0),			
		.d1(d1),
		.sel(sel)
		);

	initial
	begin
		d0[7:0]=0;
		d1[7:0]=0;
		sel[3:0]=0;
	#5;
		d0[7:0]=8'b00000011;
		d1[7:0]=8'b00000001;
		sel[3:0]=4'b0000;   		//Addition operation

	#5;
		d0[7:0]=8'b00000011;
		d1[7:0]=8'b00000001;
		sel[3:0]=4'b0001;      		//Subtraction operation

	#5;
		d0[7:0]=8'b00000011;
		d1[7:0]=8'b00000011;
		sel[3:0]=4'b0010; 		//Multiplication operation

	#5;
		d0[7:0]=8'b00001000;
		d1[7:0]=8'b00000010;
		sel[3:0]=4'b0011; 		//Division operation

	#5;
		d0[7:0]=8'b00000010;
		d1[7:0]=8'b10100010;
		sel[3:0]=4'b0100;  		//Logical AND operation ====
		
	#5;
		d0[7:0]=8'b00000010;
		d1[7:0]=8'b00000010;
		sel[3:0]=4'b0101;	    	//Logical OR operation =====

	#5;
		d0[7:0]=8'b00000010;
		d1[7:0]=8'b00000010;
		sel[3:0]=4'b0110;		//Not of AND operation =====

	#5;
		d0[7:0]=8'b00000010;
		d1[7:0]=8'b00000010;
		sel[3:0]=4'b0111;		//Not of OR operation  =====
 
	#5;
		d0[7:0]=8'b00000010;
		//d1[7:0]=8'b00000010;
		sel[3:0]=4'b1000;		//Left Shift operation =====

	#5;
		//d0[7:0]=8'b00000010;
		d1[7:0]=8'b00000010;
		sel[3:0]=4'b1001;		//Left Shift operation

	#5;
		d0[7:0]=8'b00000100;
		//d1[7:0]=8'b0;
		sel[3:0]=4'b1010;  		//Right Shift operation

	#5;
		//d0[7:0]=8'b0;
		d1[7:0]=8'b00000100;
		sel[3:0]=4'b1011;		//Right Shift operation

	#5;
		d0[7:0]=8'b00000100;
		//d1[7:0]=8'b0;
		sel[3:0]=4'b1100;		//Logical NOT operatio
	#5;
		d0[7:0]=8'b00000010;
		//d1[7:0]=8'b00000010;
		sel[3:0]=4'b1101;		//ArithmeticRightShiftoperation

	#5;
		d0[7:0]=8'b00000010;
		//d1[7:0]=8'b0;
		sel[3:0]=4'b1110;		//2's compliment

	#5;
		d0[7:0]=8'b00000010;
		d1[7:0]=8'b00000001;
		sel[3:0]=4'b1111;  		//XOR operation

end
endmodule




