module SRAM(clk,addr,data_in,cs,we,oe,data_out);

		parameter ADDR_WIDTH=4;
		parameter DATA_WIDTH=16;
		parameter DEPTH =16;

	input clk;
	input [ADDR_WIDTH-1:0] addr;
	input [DATA_WIDTH-1:0] data_in;
	input cs;
	input we;
	input oe;
	output [DATA_WIDTH-1:0]data_out;

	reg [DATA_WIDTH-1:0]tmp_data;
	reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];

	always@(posedge clk) 
	begin
	    if(cs & we)
	        mem[addr]<=data_in;    
	end

	always@(posedge clk) 
	begin
		if(cs & !we)
	    	tmp_data<=mem[addr];
	end

	assign data_out = cs & oe & !we ? tmp_data : 'hz; 

endmodule