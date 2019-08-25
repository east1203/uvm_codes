`ifndef FAB_CASE__SV
`define FAB_CASE__SV

class fab_case extends base_test;

`uvm_component_utils(fab_case);

  function new(string name="fab_case",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    uvm_config_db#(uvm_object_wrapper)::set(this,"env0.i_agt.sqr.run_phase","default_sequence",seq_fabonacci::type_id::get());
  endfunction
endclass


`endif
