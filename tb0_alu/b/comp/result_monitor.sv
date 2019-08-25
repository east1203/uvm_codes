`ifndef RESULT_MONITOR__SV
`define RESULT_MONITOR__SV

class result_monitor extends uvm_monitor;

`uvm_component_utils(result_monitor);

virtual alu_bfm bfm;

uvm_analysis_port#(transaction) ap;

function new(string name="command_monitor",uvm_component parent=null);
  super.new(name,parent);
endfunction
endclass


`endif
