`ifndef BACKDOOR_CASE__SV
`define BACKDOOR_CASE__SV

class backdoor_case extends base_case;

  `uvm_component_utils(backdoor_case);

  function new(string name="backdoor",uvm_component parent=null);
    super.new(name,parent);
  endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(uvm_object_wrapper)::set(this,"vsqr.run_phase","default_sequence",backdoor_seq::type_id::get());
endfunction  


endclass


`endif
