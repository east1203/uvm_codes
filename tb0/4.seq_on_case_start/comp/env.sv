`ifndef ENV
`define ENV

class env extends uvm_env;
`uvm_component_utils(env);

sequencer sqr;
driver drv;

function new(string name="env",uvm_component  parent=null);
  super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  sqr = sequencer::type_id::create("sqr",this);
  drv = driver::type_id::create("drv",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
endfunction

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif



