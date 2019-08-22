`ifndef RESULT_MONITOR__SV
`define RESULT_MONITOR__SV

class result_monitor extends uvm_monitor;
  
`uvm_component_utils(result_monitor);

virtual alu_bfm bfm;

uvm_analysis_port#(result_transaction) ap;

function new(string name="result_monitor",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  ap=new("ap",this);
  if(!uvm_config_db#(virtual alu_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("result_monitor","Faild to get bfm!!!");
endfunction

function void connect_phase(uvm_phase phase);
  bfm.result_monitor_h=this;
endfunction

task collect_one_pkg(shortint result);
  result_transaction result_tr;
  result_tr=new("result_tr");
  result_tr.result=result;
  ap.write(result_tr);
endtask

endclass


`endif
