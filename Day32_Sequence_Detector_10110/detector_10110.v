
//non overlapping mealey
module detector_10110(
	input clk,reset,in_data,
	output reg sq_detected,
	output reg[2:0]state
	);

	parameter GOTNOTHING=3'b000,G1=3'b001,G10=3'b010,G101=3'b011,G1011=3'b100;

	always@(posedge clk,posedge reset)
	begin
		if(reset)
			begin
			sq_detected=0;
			state=GOTNOTHING;
			end
	else
	case(state)

			GOTNOTHING:
				if(in_data)
					begin	
					sq_detected=0;
					state=G1;
					end	
				else
					begin
					sq_detected=0;
					state=GOTNOTHING;
					end

			G1:
				if(in_data)
					begin	
					sq_detected=0;
					state=G1;
					end	
				else
					begin
					sq_detected=0;
					state=G10;
					end

			G10:

				if(in_data)
					begin	
					sq_detected=0;
					state=G101;
					end	
				else
					begin
					sq_detected=0;
					state=GOTNOTHING;
					end

			G101:
				if(in_data)
					begin	
					sq_detected=0;
					state=G1011;
					end	
				else
					begin
					sq_detected=0;
					state=G10;
					end

			G1011:
				if(in_data)
					begin	
					sq_detected=0;
					state=G1;
					end	
				else
					begin
					sq_detected=1;
					state=GOTNOTHING;
					end
	endcase
end
endmodule
