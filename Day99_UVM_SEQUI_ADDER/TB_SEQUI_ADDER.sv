////////////////////////// Testbench Code
 
`timescale 1ns / 1ps
 
 
////////////////////////////////////////////////////////////////////////Transaction
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class transaction extends uvm_sequence_item;
rand bit [3:0] a;
rand bit [3:0] b;
bit [4:0] y;
 
  function new(input string inst = "transaction");
super.new(inst);
endfunction
 
`uvm_object_utils_begin(transaction)
`uvm_field_int(a, UVM_DEFAULT)
`uvm_field_int(b, UVM_DEFAULT)
`uvm_field_int(y, UVM_DEFAULT)
`uvm_object_utils_end
 
endclass

 
///////////////////////////////////////////////////////////////////////////////////////

class generator extends uvm_sequence #(transaction);
`uvm_object_utils(generator)
 
transaction t;
 
 
function new(input string inst = "GEN");
super.new(inst);
endfunction
 
 
virtual task body();
  t = transaction::type_id::create("t");
  repeat(10) 
    begin
    start_item(t);
    t.randomize();
    finish_item(t);
   `uvm_info("GEN",$sformatf("Data send to Driver a :%0d , b :%0d",t.a,t.b), UVM_NONE);  
    end
endtask
 
endclass

 
//////////////////////////////////////////////////////////////////////////////////////

class driver extends uvm_driver #(transaction);
`uvm_component_utils(driver)
 
function new(input string inst = " DRV", uvm_component c);
super.new(inst, c);
endfunction
 
transaction data;
virtual add_if aif;
  
  
  
  ///////////////////reset logic
  task reset_dut();
    aif.rst <= 1'b1;
    aif.a   <= 0;
    aif.b   <= 0;
    repeat(5) @(posedge aif.clk);
    aif.rst <= 1'b0; 
    `uvm_info("DRV", "Reset Done", UVM_NONE);
  endtask
 
  
/////////////////////


virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  data = transaction::type_id::create("data");
  
if(!uvm_config_db #(virtual add_if)::get(this,"","aif",aif)) 
`uvm_error("DRV","Unable to access uvm_config_db");
endfunction
 
   virtual task run_phase(uvm_phase phase);
    reset_dut();
    forever begin 
      seq_item_port.get_next_item(data);
    aif.a <= data.a;
    aif.b <= data.b;
    seq_item_port.item_done(); 
              `uvm_info("DRV", $sformatf("Trigger DUT a: %0d ,b :  %0d",data.a, data.b), UVM_NONE); 
    @(posedge aif.clk);
    @(posedge aif.clk);
    end
  
endtask
endclass

 
///////////////////////////////////////////////////////////////////////////////////////////

class monitor extends uvm_monitor;
`uvm_component_utils(monitor)
 
uvm_analysis_port #(transaction) send;
 
function new(input string inst = "MON", uvm_component c);
super.new(inst, c);
send = new("Write", this);
endfunction
 
transaction t;
virtual add_if aif;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
t = transaction::type_id::create("TRANS");
if(!uvm_config_db #(virtual add_if)::get(this,"","aif",aif)) 
`uvm_error("MON","Unable to access uvm_config_db");
endfunction
 
virtual task run_phase(uvm_phase phase);
  @(negedge aif.rst);
   forever begin
     repeat(2)@(posedge aif.clk);
    t.a = aif.a;
    t.b = aif.b;
    t.y = aif.y;
    `uvm_info("MON", $sformatf("Data send to Scoreboard a : %0d , b : %0d and y : %0d", t.a,t.b,t.y), UVM_NONE);
    send.write(t);
   end
endtask
endclass
 
/////////////////////////////////////////////////////////////////////////////////////////

class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
  
 
 
uvm_analysis_imp #(transaction,scoreboard) recv;
 
transaction data;
 
function new(input string inst = "SCO", uvm_component c);
super.new(inst, c);
recv = new("Read", this);
endfunction
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
data = transaction::type_id::create("TRANS");
endfunction
 
virtual function void write(input transaction t);
data = t;
  `uvm_info("SCO",$sformatf("Data rcvd from Monitor a: %0d , b : %0d and y : %0d",t.a,t.b,t.y), UVM_NONE);
if(data.y == data.a + data.b)
`uvm_info("SCO","Test Passed", UVM_NONE)
else
`uvm_info("SCO","Test Failed", UVM_NONE);
endfunction
endclass


/////////////////////////////////////////////////////////////////////////////////////
 
class agent extends uvm_agent;
`uvm_component_utils(agent)
 
 
function new(input string inst = "AGENT", uvm_component c);
super.new(inst, c);
endfunction
 
monitor m;
driver d;
uvm_sequencer #(transaction) seq;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
m = monitor::type_id::create("MON",this);
d = driver::type_id::create("DRV",this);
seq = uvm_sequencer #(transaction)::type_id::create("SEQ",this);
endfunction
 
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
d.seq_item_port.connect(seq.seq_item_export);
endfunction
endclass
 

/////////////////////////////////////////////////////////////////////////////////////////
 
class env extends uvm_env;
`uvm_component_utils(env)
 
 
function new(input string inst = "ENV", uvm_component c);
super.new(inst, c);
endfunction
 
scoreboard s;
agent a;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
s = scoreboard::type_id::create("SCO",this);
a = agent::type_id::create("AGENT",this);
endfunction
 
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
a.m.send.connect(s.recv);
endfunction
 
endclass

 
/////////////////////////////////////////////////////////////////////////////////////////
 
class test extends uvm_test;
`uvm_component_utils(test)
 
 
function new(input string inst = "TEST", uvm_component c);
super.new(inst, c);
endfunction
 
generator gen;
env e;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
gen = generator::type_id::create("GEN",this);
e = env::type_id::create("ENV",this);
endfunction
 
virtual task run_phase(uvm_phase phase);
   phase.raise_objection(this);
   gen.start(e.a.seq);
   #60;
   phase.drop_objection(this);
 
endtask
endclass


///////////////////////////////////////////////////////////////////////////////////////////
 
module add_tb();
 
add_if aif();
  
initial begin
  aif.clk = 0;
  aif.rst = 0;
end  
  
  always #10 aif.clk = ~aif.clk;
  
  
add dut (.a(aif.a), .b(aif.b), .y(aif.y), .clk(aif.clk), .rst(aif.rst));
 
initial begin
$dumpfile("dump.vcd");
$dumpvars;
end
  
initial begin  
uvm_config_db #(virtual add_if)::set(null, "*", "aif", aif);
run_test("test");
end
 
endmodule

//////////////////////////////////////////////////////////////////////////////////////