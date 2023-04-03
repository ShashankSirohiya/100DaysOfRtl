module tb_Ram16_16;
            reg [15:0]data_in;
            reg w_en;
            reg r_en;
            reg clk;
            reg [3:0]addr;
            wire [15:0]data_out;

        Ram16_16 uut0(   
                .data_in(data_in),
                .w_en(w_en),
                .r_en(r_en),
                .clk(clk),
                .address(addr),
                .d_out(data_out)
			       );

        	integer i;  

        initial
        begin
	            data_in=0;
	            w_en=0;
	            r_en=0;
	            clk=0;
	            addr=0;
	        #10;

	            for(i=0;i<=15;i=i+1)
		            begin
		                w_en=1;
		                addr=i;
		                data_in=$random;                    
		                #10;
		            end
	        #10;
	         
	                
	            for(i=0;i<=15;i=i+1)
		            begin
		                r_en=1;
		                addr=i;
		            #10;
		            end
	                
	            r_en=0;
	            w_en=0;
	        #10;

	            data_in=0;
	        #10 $finish;
	            end

	        always #5 clk=~clk;

endmodule : tb_Ram16_16