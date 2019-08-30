
`ifndef ENVIROMENT__SV
`define ENVIROMENT__SV

class enviroment extends uvm_env;

`uvm_component_utils(enviroment);

driver drv;
sequencer sqr;

function new(string name="enviroment",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  drv = driver::type_id::create("drv",this);
  sqr = sequencer::type_id::create("sqr",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif
