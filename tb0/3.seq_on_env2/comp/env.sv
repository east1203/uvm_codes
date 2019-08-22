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
 // uvm_config_db#(uvm_object_wrapper)::set(this,"sqr.run_phase","default_sequence",sequence0::type_id::get());
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
endfunction

virtual task run_phase(uvm_phase phase);
  sequence0 seq0;
  super.run_phase(phase);
  seq0=new("seq0");
  seq0.starting_phase=phase;
  seq0.start(sqr);
endtask

endclass

`endif



