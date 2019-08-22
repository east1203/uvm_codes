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
  sqr.sqr_port.connect(drv.drv_export);
endfunction


endclass

`endif



