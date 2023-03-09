
module mod7_counter(
	input clk,reset,
	output reg [2:0]count
	);

	always@(posedge clk)
	if(reset)
		count<=3'b000;

	else if(count==3'b110)
		count<=3'b000;

	else
		count<=count+1;

endmodule