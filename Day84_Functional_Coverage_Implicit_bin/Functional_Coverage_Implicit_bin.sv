// Code your testbench here
// or browse Examples


class pkt;
	randc bit[3:0] addr;
	randc bit[3:0] data;
endclass

module tb;
	pkt p=new();
	
	covergroup cg;
		//implicit
		ADDR: coverpoint p.addr; //16 bins
		DATA: coverpoint p.data;
	endgroup
	
	initial begin
		cg c=new();
		repeat(20)begin
			p.randomize();
			$display("addr=%d data=%d \n",p.addr,p.data);
          	c.sample();
		end
	end

endmodule



//////////////
run -all
coverage report -detail