`ifndef ENV
`define ENV

class env extends uvm_env;
`uvm_component_utils(env);

agent i_agt;
model mdl;

uvm_tlm_analysis_fifo#(transaction) agt2mdl_fifo;


function new(string name="env",uvm_component  parent=null);
  super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  i_agt = agent::type_id::create("i_agt",this);
  i_agt.is_active = UVM_ACTIVE;
  mdl=model::type_id::create("mdl",this);

  agt2mdl_fifo = new("agt2mdl_fifl",this);
endfunction:build_phase

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  i_agt.ap.connect(agt2mdl_fifo.analysis_export);
  mdl.port.connect(agt2mdl_fifo.blocking_get_export);
endfunction:connect_phase

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif



