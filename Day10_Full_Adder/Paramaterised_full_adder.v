//Paramaterised_full_adder

module Paramaterised_full_adder (a, b, cin, sum, carry);
	parameter size=0;
		input [size-1: 0] a, b; 
		input cin;
		output [size-1: 0] sum;
		output carry;

	assign {carry, sum}= a + b + cin; 

endmodule : Paramaterised_full_adder














/*Here, This code defines a parameterized full adder module in Verilog. 
The module named "Paramaterised_full_adder" that has inputs "a", "b", and "cin", and outputs "sum" and "carry".
parameter size=0;
Declares a parameter named "size" and initializes it with a value of 0. This parameter is used to specify 
the size of the adder, which determines the number of bits that can be added. input [size-1: 0] a, b;
Next line declares two input ports "a" and "b", with a size specified by the parameter "size".input cin;
then the Next line declares an input port "cin" which is used to represent the carry input to the adder.output 
[size-1: 0] sum;
Next line declares an output port "sum" which is used to represent the sum output from the adder.output carry;
Next line declares an output port "carry" which is used to represent the carry output from the adder.
Assign line uses an assign statement to calculate the sum and carry output values. The expression adds the inputs "a","b",
and "cin", and assigns the result to the output signals "carry" and "sum".
The curly braces around "carry, sum" create a concatenation of the two signals, allowing them to be assigned 
simultaneously.*/