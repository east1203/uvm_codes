
`ifndef ENVIROMENT__SV
`define ENVIROMENT__SV

class enviroment extends uvm_env;

`uvm_component_utils(enviroment);

agent i_agt;

uvm_tlm_analysis_fifo#(transaction) agt2mdl;

function new(string name="enviroment",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  i_agt=agent::type_id::create("i_agt",this);
  uvm_config_db#(uvm_active_passive_enum)::set(this,"i_agt","is_active",UVM_ACTIVE);
//  i_agt.is_active = UVM_ACTIVE;
  agt2mdl=new("agt2mdl",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  i_agt.ap_apb.connect(agt2mdl.analysis_export);
endfunction


endclass

`endif
