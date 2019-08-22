`ifndef ENV
`define ENV

class env extends uvm_env;
`uvm_component_utils(env);

agent i_agt;
agent o_agt;
model mdl;
scoreboard scb;

uvm_tlm_analysis_fifo#(transaction) agt2mdl_fifo;
uvm_tlm_analysis_fifo#(result_transaction) mdl2scb_fifo;
uvm_tlm_analysis_fifo#(result_transaction) agt2scb_fifo;

function new(string name="env",uvm_component  parent=null);
  super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  i_agt = agent::type_id::create("i_agt",this);
  i_agt.is_active = UVM_ACTIVE;
  o_agt = agent::type_id::create("o_agt",this);
  o_agt.is_active = UVM_PASSIVE;
  mdl=model::type_id::create("mdl",this);
  scb=scoreboard::type_id::create("scb",this);

  agt2mdl_fifo = new("agt2mdl_fifo",this);
  mdl2scb_fifo = new("mdl2scb_fifo",this);
  agt2scb_fifo = new("agt2scb_fifo",this);
endfunction:build_phase

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(i_agt.is_active == UVM_ACTIVE)
    i_agt.ap.connect(agt2mdl_fifo.analysis_export);
  mdl.port.connect(agt2mdl_fifo.blocking_get_export);
  if(o_agt.is_active == UVM_PASSIVE)
    o_agt.rap.connect(agt2scb_fifo.analysis_export);
  scb.rly_port.connect(agt2scb_fifo.blocking_get_export);
  mdl.ap.connect(mdl2scb_fifo.analysis_export);
  scb.exp_port.connect(mdl2scb_fifo.blocking_get_export);
endfunction:connect_phase

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif



