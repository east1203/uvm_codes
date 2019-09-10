`ifndef CASE__SV
`define CASE__SV

class case0 extends base_case;

`uvm_component_utils(case0);

function new(string name="case0",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(uvm_object_wrapper)::set(this,"env.ip_sqr.run_phase","default_sequence",ip_sequence::get_type());
  uvm_config_db#(uvm_object_wrapper)::set(this,"env.sqr.run_phase","default_sequence",mac_sequence::get_type());
endfunction

endclass


`endif
