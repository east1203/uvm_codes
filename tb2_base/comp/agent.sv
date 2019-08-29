`ifndef AGENT__SV
`define AGENT__SV


class agent extends uvm_agent;

`uvm_component_utils(agent);

function new(string name="agent",uvm_component parent=null);
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
