`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;
//  `uvm_object_utils(obj)
  
  typedef enum bit [1:0] {s0 , s1, s2, s3} state_type;
  rand state_type state;
  
  real temp = 12.34;
  string str = "UVM";
 
  function new(string path = "obj");
    super.new(path);
  endfunction
  
 
  `uvm_object_utils_begin(obj)
  `uvm_field_enum(state_type, state, UVM_DEFAULT);
  `uvm_field_string(str,UVM_DEFAULT);
  `uvm_field_real(temp, UVM_DEFAULT);
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