`ifndef PREDICTOR_CASE__SV
`define PREDICTOR_CASE__SV

class predictor_case extends base_case;

`uvm_component_utils(predictor_case);

function new(string name="predictor_case",uvm_component parent=null);
  super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(uvm_object_wrapper)::set(this,"vsqr.run_phase","default_sequence",predictor_seq::type_id::get());
endfunction

endclass


`endif
