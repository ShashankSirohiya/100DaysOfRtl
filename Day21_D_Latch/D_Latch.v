module DLatch_NB(input d,en,
		output reg q,qbar);

	always@(d,en)
		begin
			if(~en) 
			begin
			     q <= q;
			     qbar <= qbar;
			end
			else begin
			     q <= d;
			     qbar <= (~d);
			end
		end	
endmodule
