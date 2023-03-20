module tb_right_shift_bit;

	reg clk, rst;
	reg [3:0] din;
	wire [3:0] dout;

	right_shift_bit uut(
	  .clk(clk),
	  .rst(rst),
	  .din(din),
	  .dout(dout)
	);

		initial begin
		  clk = 0;
		  forever #5 clk = ~clk;
		end

		initial begin
		  rst = 1;
		  din = 4'b0001;
		  #10 rst = 0;
		      din = 4'b0000;
		  #15 din = 4'b0001;
		  #10 din = 4'b0010;
		  #10 din = 4'b0100;
		  #10 din = 4'b1000;
		  #10 din = 4'b0000;
		  #10 din = 4'b0001;
		  #10 din = 4'b0010;
		  #10 din = 4'b0100;
		  #110 $finish;
		end

endmodule