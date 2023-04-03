module sync_ram (
    input clk,                  //Clock
    input rst_n,                //Asynchronous Active Low Reset
    input cs,                   //Chip Select
    input oe,                   //Output Enable
    input we,                   //Write Enable
    input [7:0] address,        //Address Bus
    input [7:0] data_in,        //Data In Bus
    output reg [7:0] data_out   //Data Out Bus
);
    reg [7:0] ram [255:0];
    integer i;

    always@(posedge clk,negedge rst_n) 
	    begin
	        if(~rst_n) 
	            for(i=0;i<256;i=i+1) 
	                ram[i]<=0;
	        else if(cs & we) 
	                ram[address]<=data_in;
	    end

    always@(posedge clk) 
	    begin
	        if(cs & oe) 
	            data_out<=ram[address];
	        else 
	            data_out<=8'hz; 
	    end

endmodule