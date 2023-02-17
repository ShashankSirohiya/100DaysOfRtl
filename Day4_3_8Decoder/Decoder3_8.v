module Decoder3_8(input [2:0] i,
   	          output reg[7:0] y);
	always@(i)
		begin
		y=0;
			case(i)	
					3'b000 : y[0] = 1'b1;
					3'b001 : y[1] = 1'b1;
					3'b010 : y[2] = 1'b1;
					3'b011 : y[3] = 1'b1;
					3'b100 : y[4] = 1'b1;
					3'b101 : y[5] = 1'b1;
					3'b110 : y[6] = 1'b1;
					3'b111 : y[7] = 1'b1;
			endcase
		end	
endmodule : Decoder3_8

