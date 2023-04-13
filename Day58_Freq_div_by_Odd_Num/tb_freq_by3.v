module clk_div_by_3_tb;

    reg clk;
    wire clk_out;

    clk_div_by_3 dut(
        .clk(clk),
        .clk_out(clk_out)
    );


	initial begin
		clk = 0;
	end
	
	always begin
		clk = ~clk;
		#20;
	end
      
endmodule