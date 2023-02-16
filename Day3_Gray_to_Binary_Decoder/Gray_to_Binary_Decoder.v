module Gray_to_Binary_Decoder(input [2:0]G, 
			      output [2:0]B);
	assign B[2] = G[2];
	assign B[1] = G[1]^B[2];
	assign B[0] = G[0]^B[1];

endmodule : Gray_to_Binary_Decoder
