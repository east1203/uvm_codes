`ifndef MONITOR__SV
`define MONITOR__SV

class monitor extends uvm_monitor#(transaction);

`uvm_component_utils(monitor);

function new(string name="monitor",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);

  super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);

endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);

endtask

endclass

`endif
