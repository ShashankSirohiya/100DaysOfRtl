// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
  
	initial begin
	#50;
	`uvm_info("TB_TOP","Display stimulus",UVM_LOW);
	$display("Display stimulus with display");
	end

	int data = 56;
		initial begin
		`uvm_info("TB_TOP",$sformatf("Value of data : %0d",data),UVM_NONE);
		end

	initial begin
		uvm_top.set_report_verbosity_level(UVM_HIGH);
      $display("Default Verbosity level : %0d", uvm_top.get_report_verbosity_level);
		`uvm_info("TB_TOP","String",UVM_HIGH);
	end
endmodule