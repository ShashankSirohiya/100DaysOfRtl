//big'O notation...from normal data to little_endianess
module Endianess(input [31:0]data_in,
		 output[31:0]little_e,
		 output[31:0]big_e
			 );
	
	assign little_e = {data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24]};
	assign big_e = {data_in[31:24],data_in[23:16],data_in[15:8],data_in[7:0]};

endmodule : Endianess




/*
So Why Does Everyone Have It Backwards?
However counter-intuitive it might seem at first, there are valid reasons why little-endian
is used over big-endian. The reason for the widespread use of little-endian is not because
of the ease of user understanding (as you might have figured out), but rather for ease of
the computer. Let’s take a look at why. We will use this 8-byte value 0x0000000000000042.

When we store it in little-endian we have the following.
0x00: 42 00 00 00 00 00 00 00

and in big-endian we would get.
0x00: 00 00 00 00 00 00 00 42  */
