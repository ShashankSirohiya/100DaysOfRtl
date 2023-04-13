module d_ff(
    input in,
    input clk,
    input rst,
    output reg q,
    output qbar
    ); 
	assign qbar=~q;
	always@(posedge clk, posedge rst)
	begin
		if(rst)
			q<= 0;
		else 
			q <=in;
		end
endmodule

module freq_by2(
    input clk,reset,
	 output q,qn
	 );

	wire t;
	d_ff d1(t,clk,reset,q,qn);
	assign t = qn;
	
endmodule
