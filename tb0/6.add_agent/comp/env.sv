`ifndef ENV
`define ENV

class env extends uvm_env;
`uvm_component_utils(env);
agent agt;

function new(string name="env",uvm_component  parent=null);
  super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agt = agent::type_id::create("agt",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask

endclass

`endif



