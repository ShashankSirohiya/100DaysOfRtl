module Binary_to_Gray_Decoder(input [2:0]B,
							  output [2:0]G 
							  	);
	assign G[2] = B[2];
	assign G[1] = B[2] ^ B[1];
	assign G[0] = B[1] ^ B[0];

endmodule : Binary_to_Gray_Decoder

