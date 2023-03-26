module tb_Parameterised_Register;

	  reg in;
	  reg clk;
	  reg rst;
	  wire op;

  // Parameters
  localparam CLK_PERIOD = 10;
  localparam WIDTH = 8;  

  Parameterised_Register uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .op(op)
  );


	initial
	begin
	    clk = 0;
	    rst = 1;
	    #2 rst = 0;

	    // Test case 1: all zeros
	    in = 0;
	    #20;

	    // Test case 2: toggling input
	    in = 1'b0;
	    #10 in = 1'b1;
	    #10 in = 1'b0;
	    #10 in = 1'b1;
	    #10 in = 1'b0;
	    #20;

	    // Test case 3: single bit high input
	    in = 1'b1;
	    #20;

	    // Test case 4: random input
	    in = $random;
	    #20;

	    $finish;
    end

  	  // Clock generation
    always #5 clk=~clk;

endmodule : tb_Parameterised_Register