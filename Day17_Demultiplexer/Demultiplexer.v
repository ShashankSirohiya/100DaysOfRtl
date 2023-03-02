module Dmux(input i,
	    input [1:0] s,
	    output reg [3:0] y);
	always@(i,s)
		begin
		y=0;
			case (s)
				2'b00 : y[0] = i;
				2'b01 : y[1] = i;
				2'b10 : y[2] = i;
				2'b11 : y[3] = i;
			endcase
		end
endmodule : Dmux
