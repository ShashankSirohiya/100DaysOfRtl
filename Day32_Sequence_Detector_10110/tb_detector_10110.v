module tb_detector_10110;
		reg clk;
		reg rst;
		reg in_data;
		wire sq_detected;
		wire [2:0]state;



	detector_10110 uut0 (       .clk(clk),
	                            .reset(rst),
	                            .in_data(in_data),
	                            .sq_detected(sq_detected),
	                            .state(state)
	    );

	    initial
	    begin
	            clk=1;
	            in_data=0;
	            rst=0;

	            #5;
	            rst=1;
	            in_data=$random;

	            #4;
	            rst=0;
	            in_data=$random;

	            #10;
	            in_data=1;

	            #10;
	            in_data=0;

	            #10;
	            in_data=1;

	            #10;
	            in_data=1;

	            #10;
	            in_data=0;

	            #10;
	            in_data=1;

	            #10;
	            in_data=1'bx;

	            #10;
	            in_data=$random;

	            #10;
	            in_data=0;
	    end

	            always #5 clk=~clk;

endmodule