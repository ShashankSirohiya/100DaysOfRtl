`timescale 1ns / 1ps
 
`include "uvm_macros.svh"
 import uvm_pkg::*;
 

////////////////////////////////////////////////////////////////////////////////////
class abp_config extends uvm_object; /////configuration of env
  `uvm_object_utils(abp_config)
  
  function new(string name = "abp_config");
    super.new(name);
  endfunction
  
  uvm_active_passive_enum is_active = UVM_ACTIVE;
endclass

 
typedef enum bit [1:0]   {readd = 0, writed = 1, rst = 2} oper_mode;


//***********************************************
// TRANSACTION_CLASS   
//***********************************************
class transaction extends uvm_sequence_item;
  
    rand oper_mode   op;
    rand logic            	PWRITE;
	rand logic [31 : 0]   	PWDATA;
	rand logic [31 : 0]	  	PADDR;
	
    // Output Signals of DUT for APB UART's transaction
	logic				    PREADY;
	logic 				    PSLVERR;
    logic [31: 0]		    PRDATA;
 
        `uvm_object_utils_begin(transaction)
        `uvm_field_int (PWRITE,UVM_ALL_ON)
        `uvm_field_int (PWDATA,UVM_ALL_ON)
        `uvm_field_int (PADDR,UVM_ALL_ON)
        `uvm_field_int (PREADY,UVM_ALL_ON)
        `uvm_field_int (PSLVERR,UVM_ALL_ON)
        `uvm_field_int (PRDATA,UVM_ALL_ON)
        `uvm_field_enum(oper_mode, op, UVM_DEFAULT)
        `uvm_object_utils_end
  
  constraint addr_c { PADDR <= 31; }
  constraint addr_c_err { PADDR > 31; }
 
  function new(string name = "transaction");
    super.new(name);
  endfunction
 
endclass : transaction
 

///////////////////write seq
class write_data extends uvm_sequence#(transaction);
  `uvm_object_utils(write_data)
  
  transaction tr;
 
  function new(string name = "write_data");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);//enable 
        tr.addr_c_err.constraint_mode(0);//disable
        start_item(tr);
        assert(tr.randomize);
        tr.op = writed;
        finish_item(tr);
      end
  endtask
  
 
endclass


////////////////////////////////////////////////read seq
class read_data extends uvm_sequence#(transaction);
  `uvm_object_utils(read_data)
  
  transaction tr;
 
  function new(string name = "read_data");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        tr.addr_c_err.constraint_mode(0);//disable
        start_item(tr);
        assert(tr.randomize);
        tr.op = readd;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
 
 
//////////////////////////////////////////////////////////////////////////
 
class write_read extends uvm_sequence#(transaction); //////read after write
  `uvm_object_utils(write_read)
  
  transaction tr;
 
  function new(string name = "write_read");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        tr.addr_c_err.constraint_mode(0);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = writed;
        finish_item(tr);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = readd;
        finish_item(tr);
 
      end
  endtask
  
 
endclass

/////////////////////////////////////////////////write bulk read bulk
class writeb_readb extends uvm_sequence#(transaction);
  `uvm_object_utils(writeb_readb)
  
  transaction tr;
 
  function new(string name = "writeb_readb");
    super.new(name);
  endfunction
  
  virtual task body();
    
    repeat(15) begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        tr.addr_c_err.constraint_mode(0);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = writed;
        finish_item(tr);
    end
            
    repeat(15) begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        tr.addr_c_err.constraint_mode(0);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = readd;
        finish_item(tr);
      
    end
  endtask
  
 endclass
 
/////////////////////////////////////////////////////////////////
//////////////////////slv_error_write
class write_err extends uvm_sequence#(transaction);
  `uvm_object_utils(write_err)
  
  transaction tr;
 
  function new(string name = "write_err");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(0);
        tr.addr_c_err.constraint_mode(1);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = writed;
        finish_item(tr);
      end
  endtask
  
 
endclass
///////////////////////////////////////////////////////////////
/////////////////////////read err
 
 
class read_err extends uvm_sequence#(transaction);
  `uvm_object_utils(read_err)
  
  transaction tr;
 
  function new(string name = "read_err");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(0);
        tr.addr_c_err.constraint_mode(1);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = readd;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
///////////////////////////////////////////////////////////////
 
class reset_dut extends uvm_sequence#(transaction);
  `uvm_object_utils(reset_dut)
  
  transaction tr;
 
  function new(string name = "reset_dut");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        tr.addr_c_err.constraint_mode(0);
        
        start_item(tr);
        assert(tr.randomize);
        tr.op = rst;
        finish_item(tr);
      end
  endtask
  
 
endclass
 
 
 
////////////////////////////////////////////////////////////

//***********************************************
// DRIVER_CLASS   
//***********************************************
class driver extends uvm_driver #(transaction);
  `uvm_component_utils(driver)
  
  virtual apb_if vif;
  transaction tr;
  
  
  function new(input string path = "drv", uvm_component parent = null);
    super.new(path,parent);
  endfunction
  
 virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     tr = transaction::type_id::create("tr");
      
      if(!uvm_config_db#(virtual apb_if)::get(this,"","vif",vif))//uvm_test_top.env.agent.drv.aif
      `uvm_error("drv","Unable to access Interface");
  endfunction
  
  
  
  task reset_dut();
 
    repeat(5) 
    begin
    vif.presetn   <= 1'b0;
    vif.paddr     <= 'h0;
    vif.pwdata    <= 'h0;
    vif.pwrite    <= 'b0;
    vif.psel      <= 'b0;
    vif.penable   <= 'b0; 
     `uvm_info("DRV", "System Reset : Start of Simulation", UVM_MEDIUM);
     @(posedge vif.pclk);
      end
  endtask
  
  task drive();
    reset_dut();
   forever begin
     
         seq_item_port.get_next_item(tr);
     
     
                   if(tr.op ==  rst)
                          begin
                            vif.presetn   <= 1'b0;
                            vif.paddr     <= 'h0;
                            vif.pwdata    <= 'h0;
                            vif.pwrite    <= 'b0;
                            vif.psel      <= 'b0;
                            vif.penable   <= 'b0;
                          @(posedge vif.pclk);  
                          end
 
                  else if(tr.op == writed)
                          begin
                            vif.psel    <= 1'b1;
                            vif.paddr   <= tr.PADDR;
                            vif.pwdata  <= tr.PWDATA;
                            vif.presetn <= 1'b1;
                            vif.pwrite  <= 1'b1;
                            @(posedge vif.pclk);
                            vif.penable <= 1'b1;
     `uvm_info("DRV", $sformatf("mode:%0s, addr:%0d, wdata:%0d, rdata:%0d, slverr:%0d",tr.op.name(),tr.PADDR,tr.PWDATA,tr.PRDATA,tr.PSLVERR), UVM_NONE);
                            @(negedge vif.pready);
                            vif.penable <= 1'b0;
                            tr.PSLVERR   = vif.pslverr;
                            
                          end
                      else if(tr.op ==  readd)
                          begin
                            vif.psel    <= 1'b1;
                            vif.paddr   <= tr.PADDR;
                            vif.presetn <= 1'b1;
                            vif.pwrite  <= 1'b0;
                            @(posedge vif.pclk);
                            vif.penable <= 1'b1;
     `uvm_info("DRV", $sformatf("mode:%0s, addr:%0d, wdata:%0d, rdata:%0d, slverr:%0d",tr.op.name(),tr.PADDR,tr.PWDATA,tr.PRDATA,tr.PSLVERR), UVM_NONE);
                            @(negedge vif.pready);
                            vif.penable <= 1'b0;
                            tr.PRDATA     = vif.prdata;
                            tr.PSLVERR    = vif.pslverr;
                          end
       seq_item_port.item_done();
     
   end
  endtask
  
 
  virtual task run_phase(uvm_phase phase);
    drive();
  endtask
 
endclass
 
//////////////////////////////////////////////////////////////////
 
//***********************************************
// MON_CLASS   
//***********************************************
class mon extends uvm_monitor;
`uvm_component_utils(mon)
 
uvm_analysis_port#(transaction) send;
transaction tr;
virtual apb_if vif;
 
    function new(input string inst = "mon", uvm_component parent = null);
    super.new(inst,parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    send = new("send", this);
      if(!uvm_config_db#(virtual apb_if)::get(this,"","vif",vif))//uvm_test_top.env.agent.drv.aif
        `uvm_error("MON","Unable to access Interface");
    endfunction
    
    
    virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.pclk);
      if(!vif.presetn)
        begin
        tr.op      = rst; 
        `uvm_info("MON", "SYSTEM RESET DETECTED", UVM_NONE);
         send.write(tr);
        end
      else if (vif.presetn && vif.pwrite)
         begin
          @(negedge vif.pready);
          tr.op     = writed;
          tr.PWDATA = vif.pwdata;
          tr.PADDR  =  vif.paddr;
          tr.PSLVERR  = vif.pslverr;
          `uvm_info("MON", $sformatf("DATA WRITE addr:%0d data:%0d slverr:%0d",tr.PADDR,tr.PWDATA,tr.PSLVERR), UVM_NONE); 
          send.write(tr);
         end
      else if (vif.presetn && !vif.pwrite)
         begin
           @(negedge vif.pready);
          tr.op     = readd; 
          tr.PADDR  =  vif.paddr;
          tr.PRDATA   = vif.prdata;
          tr.PSLVERR  = vif.pslverr;
          `uvm_info("MON", $sformatf("DATA READ addr:%0d data:%0d slverr:%0d",tr.PADDR, tr.PRDATA,tr.PSLVERR), UVM_NONE); 
          send.write(tr);
         end
    
    end
   endtask 
 
endclass
 
/////////////////////////////////////////////////////////////////////
 
//***********************************************
// SCB_CLASS   
//***********************************************
class sco extends uvm_scoreboard;
`uvm_component_utils(sco)
 
  uvm_analysis_imp#(transaction,sco) recv;
  bit [31:0] arr[32] = '{default:0};
  bit [31:0] addr    = 0;
  bit [31:0] data_rd = 0;
 
 
 
    function new(input string inst = "sco", uvm_component parent = null);
    super.new(inst,parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("recv", this);
    endfunction
    
    
  virtual function void write(transaction tr);
    if(tr.op == rst)
              begin
                `uvm_info("SCO", "SYSTEM RESET DETECTED", UVM_NONE);
              end  
    else if (tr.op == writed)
      begin
            if(tr.PSLVERR == 1'b1)
                begin
                  `uvm_info("SCO", "SLV ERROR during WRITE OP", UVM_NONE);
                end
              else
                begin
                  arr[tr.PADDR] = tr.PWDATA;
                  `uvm_info("SCO", $sformatf("DATA WRITE OP  addr:%0d, wdata:%0d arr_wr:%0d",tr.PADDR,tr.PWDATA,  arr[tr.PADDR]), UVM_NONE);
                end
      end
    else if (tr.op == readd)
      begin
           if(tr.PSLVERR == 1'b1)
                begin
                  `uvm_info("SCO", "SLV ERROR during READ OP", UVM_NONE);
                end
              else 
                begin
                         data_rd = arr[tr.PADDR];
                 		 if (data_rd == tr.PRDATA)
                 			 `uvm_info("SCO", $sformatf("DATA MATCHED : addr:%0d, rdata:%0d",tr.PADDR,tr.PRDATA), UVM_NONE)
                         else
                           `uvm_info("SCO",$sformatf("TEST FAILED : addr:%0d, rdata:%0d data_rd_arr:%0d",tr.PADDR,tr.PRDATA,data_rd), UVM_NONE) 
                end
 
      end
     
  
    $display("----------------------------------------------------------------");
    endfunction
 
endclass
 
/////////////////////////////////////////////////////////////////////

//***********************************************
// AGENT_CLASS   
//*********************************************** 
class agent extends uvm_agent;
`uvm_component_utils(agent)
  
  abp_config cfg;
 
function new(input string inst = "agent", uvm_component parent = null);
super.new(inst,parent);
endfunction
 
 driver d;
 uvm_sequencer#(transaction) seqr;
 mon m;
 
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  cfg =  abp_config::type_id::create("cfg"); 
   m = mon::type_id::create("m",this);
  
  if(cfg.is_active == UVM_ACTIVE)
   begin   
   d = driver::type_id::create("d",this);
   seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
   end
  
  
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
  if(cfg.is_active == UVM_ACTIVE) begin  
    d.seq_item_port.connect(seqr.seq_item_export);
  end
endfunction
 
endclass
 
//////////////////////////////////////////////////////////////////////////////////

//***********************************************
// ENV_CLASS   
//***********************************************
class env extends uvm_env;
`uvm_component_utils(env)
 
function new(input string inst = "env", uvm_component c);
super.new(inst,c);
endfunction
 
agent a;
sco s;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  a = agent::type_id::create("a",this);
  s = sco::type_id::create("s", this);
endfunction
 
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
a.m.send.connect(s.recv);
endfunction
 
endclass
 
//////////////////////////////////////////////////////////////////////////
 
//***********************************************
// TB_TEST   
//***********************************************
class test extends uvm_test;
`uvm_component_utils(test)
 
function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction
 
env e;
write_read wrrd;
writeb_readb wrrdb;
write_data wdata;  
read_data rdata;
write_err werr;
read_err rerr;
reset_dut rstdut;  
  
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  e      = env::type_id::create("env",this);
  wrrd   = write_read::type_id::create("wrrd");
  wdata  = write_data::type_id::create("wdata");
  rdata  = read_data::type_id::create("rdata");
  wrrdb  = writeb_readb::type_id::create("wrrdb");
  werr   = write_err::type_id::create("werr");
  rerr   = read_err::type_id::create("rerr");
  rstdut = reset_dut::type_id::create("rstdut");
endfunction
 
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
wrrdb.start(e.a.seqr);
#20;
phase.drop_objection(this);
endtask
endclass
 
//////////////////////////////////////////////////////////////////////

//***********************************************
// TB_TOP   
//***********************************************
module tb;
  
  
  apb_if vif();
  
  apb_ram dut (.presetn(vif.presetn), .pclk(vif.pclk), .psel(vif.psel), .penable(vif.penable), .pwrite(vif.pwrite), .paddr(vif.paddr), .pwdata(vif.pwdata), .prdata(vif.prdata), .pready(vif.pready), .pslverr(vif.pslverr));
  
  initial begin
    vif.pclk <= 0;
  end
 
   always #10 vif.pclk <= ~vif.pclk;
 
  
  
  initial begin
    uvm_config_db#(virtual apb_if)::set(null, "*", "vif", vif);
    run_test("test");
   end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
  
endmodule

////////////////////////////////////////////////////////////////////////////////