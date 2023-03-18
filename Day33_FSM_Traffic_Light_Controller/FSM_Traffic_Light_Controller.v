module tlc(
	input clk,reset,pass,
	output reg[1:0]state,
	output reg red,yellow,green
	);
	localparam redsignal=2'b00,redwithyellow=2'b01,greensignal=2'b10,greenwithyellow=2'b11;

	always@(posedge clk)
		begin
			if(reset==1'b1) begin
					red<=1'b1;
					yellow<=1'b0;
					green<=1'b0;
					state<=redsignal;
				end

				else if(pass==1'b1) begin
				    red<=1'b0;
					yellow<=1'b0;
					green<=1'b1;
					state<=greensignal;
				end

			else begin
				case(state)
					redsignal:
						begin
							red<=1'b1;
							yellow<=1'b0;
							green<=1'b0;
							#10;
							state<=redwithyellow;
						end

					redwithyellow:
						begin
							red<=1'b1;
							yellow<=1'b1;
							green<=1'b0;
							#10;
							state<=greensignal;
						end

					greensignal:
						begin
							red<=1'b0;
							yellow<=1'b0;
							green<=1'b1;
							#10;
							state<=greenwithyellow;
						end

					greenwithyellow:	
						begin
							red<=1'b0;
							yellow<=1'b1;
							green<=1'b1;
							#10;
							state<=redsignal;
						end
					
					default:
						begin
						   red<=1'bz;
						   yellow<=1'bz;
						   green<=1'bz;
						   #10;
						   state<=redsignal;
						end
				endcase
			end
		end
endmodule : tlc
