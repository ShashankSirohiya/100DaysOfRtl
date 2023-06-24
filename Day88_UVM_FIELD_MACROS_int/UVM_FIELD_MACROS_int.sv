// Code your testbench here
// or browse Examples

// `include "uvm_macros.svh"
// import uvm_pkg::*;
 
// class obj extends uvm_object;
//   `uvm_object_utils(obj)
 
//   function new(string path = "obj");
//     super.new(path);
//   endfunction
  
//   rand bit [3:0] a;
  
// endclass
 
// module tb;
//   obj o;
  
//   initial begin
//     o = new("obj");
//     o.randomize();
//     `uvm_info("TB_TOP", $sformatf("Value of a : %0d", o.a), UVM_NONE);
//   end
  
// endmodule
/////////////////////////////////////////////////////////////////////////////
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;
//  `uvm_object_utils(obj)
 
  function new(string path = "obj");
    super.new(path);
  endfunction
  
  rand bit [3:0] a;
  rand bit [7:0] b;
 
  `uvm_object_utils_begin(obj)
  `uvm_field_int(a, UVM_NOPRINT | UVM_BIN);
  `uvm_field_int(b, UVM_DEFAULT | UVM_DEC);
  `uvm_object_utils_end
 
  
endclass
 
module tb;
  obj o;
  
  initial begin
    o = new("obj");
    o.randomize();
    o.print(uvm_default_table_printer);
  end
  
endmodule
