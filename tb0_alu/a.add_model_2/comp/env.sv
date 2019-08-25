`ifndef ENV
`define ENV

class env extends uvm_env;
`uvm_component_utils(env);
agent i_agt;
model mdl;

uvm_tlm_analysis_fifo#(transaction) agt2mdl;
uvm_tlm_analysis_fifo#(result_transaction) mdl2scb;

function new(string name="env",uvm_component  parent=null);
  super.new(name,parent);
  agt2mdl=new("agt2mdl",this);
  mdl2scb=new("mdl2scb",this);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  i_agt = agent::type_id::create("i_agt",this);
  mdl=model::type_id::create("mdl",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  i_agt.cmd_ap.connect(agt2mdl.analysis_export);
  mdl.port.connect(agt2mdl.blocking_get_export);
  mdl.ap.connect(mdl2scb.analysis_export);
endfunction

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif



