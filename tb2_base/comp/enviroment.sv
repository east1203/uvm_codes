
`ifndef ENVIROMENT__SV
`define ENVIROMENT__SV

class enviroment extends uvm_env;

`uvm_component_utils(enviroment);

function new(string name="enviroment",uvm_component parent=null);
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
