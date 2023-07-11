`include "uvm_macros.svh"
import uvm_pkg::*;
 
class comp extends uvm_component;
  `uvm_component_utils(comp)
  
  function new(string path = "comp", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("COMP", "Build phase of comp executed", UVM_NONE); 
  endfunction
  
endclass

////////////////////////////////////////////////////////////////////////////////

module tb;
  
  comp c;
  
  initial begin
    c = comp::type_id::create("c", null);
    c.build_phase(null);
  end
  
  initial begin
    run_test("comp");
  end
  
endmodule
