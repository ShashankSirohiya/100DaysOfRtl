// Code your testbench here
// or browse Examples

class pkt;
	rand bit[3:0] addr;
	rand bit[3:0] data;
endclass

module tb;
	pkt p=new();

	covergroup cg;
      ADDR: coverpoint p.addr( bins b1={1,11};
							   bins b2 ={[1:4]}; 
                               bins b3[] ={[5:8]};) //{5,6,7,8}//{1,[2:4],5} 
      DATA: coverpoint p.data( bins b4 ={[2,10]};
                               bins b5 ={[1:4]};)
	endgroup

	initial begin
		cd c=new();
		repeat(20)begin
			p.randomize();
		$display("addr=%d data=%d \n",p.addr,p.data);
			c.sample();
		end
	end

endmodule