// Code your testbench here
// or browse Examples

package pkg;
 	
	function int add(int a,b);
		return a+b;
	endfunction

	function void print(int c);
      $display("Addition is %0d", c);
	endfunction

endpackage

import pkg::*;
module tb;
	int a=10, b=20;
	int c;

	initial begin
 		c=add(10,20);
		void'(print(c));
	end
endmodule

