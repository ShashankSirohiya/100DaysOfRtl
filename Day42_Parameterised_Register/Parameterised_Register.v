module Parameterised_Register(
    input in,
    input clk,
    input rst,
    output op
        );
    localparam WIDTH=8;
   
    reg [0:WIDTH-1]d_ff;

    always@(posedge clk,posedge rst)
    	d_ff[0]<= rst? 0:in;      

    genvar i;                 
    generate                
		for(i=0;i< WIDTH-1;i=i+1) 
		begin
			always@(posedge clk,posedge rst)
			    d_ff[i+1] <= rst?0:d_ff[i];
	    end
    endgenerate  

    assign op = d_ff[WIDTH-1];

endmodule : Parameterised_Register