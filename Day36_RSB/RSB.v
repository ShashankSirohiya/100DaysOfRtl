module right_shift_bit(
	  input clk, rst,
	  input [3:0] din,
	  output reg [3:0] dout
	);

	always @(posedge clk or posedge rst) begin
	  if (rst) begin
	    dout <= 4'b0000;
	  end else begin
	    dout[0] <= din[0];
	    dout <= {1'b0, din[3:1]};    
	  end
	end

endmodule : right_shift_bit