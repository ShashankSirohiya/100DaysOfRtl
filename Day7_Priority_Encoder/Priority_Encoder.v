module priority_encoder(input [2:0]i,
					    output reg [1:0]y);
	always@(i)
		begin
			if    (i[2] == 1)  //2nd place
				    y=2'b10;

			else if(i[1] == 1) //1st place
				    y=2'b01;
				
			else if(i[0] == 1) //0th place
					y=2'b00;
				
			else 
					y=2'b11;   //More than one place high
		end
endmodule













/*Here,module called "priority_encoder" that takes in a 3-bit input signal (i) and generates a 2-bit output signal (y). 
The "output reg" declaration for "y" specifies that "y" is a register output that can be assigned values using the 
"always" block.This "always" block that triggers whenever there is a change in the input signal "i". It implements the
logic of the priority encoder by checking the input signal from the most significant bit (bit 2) to the least significant
bit (bit 0). The priority encoder generates a 2-bit output signal based on the position of the highest priority bit that 
is set to 1.

The first statement checks if the most significant bit (i[2]) is set to 1. If it is, it sets the output signal "y" 
to 2'b10 (binary 2). This means that the input signal has a higher priority than the other two bits.
The second statement checks the next highest priority bit (i[1]). If it is set to 1, it sets the output signal "y" to 
2'b01 (binary 1). This means that the input signal has the second highest priority.
The third statement checks the least significant bit (i[0]). If it is set to 1, it sets the output signal "y" to 
2'b00 (binary 0). This means that the input signal has the lowest priority.
Finally, if none of the input signals are set to 1, the "else" statement sets the output signal "y" to 2'b11 (binary 3).
This indicates that the input signal has more than one bit set to 1, which is not allowed in a priority encoder. */