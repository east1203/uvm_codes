`ifndef REG_CASE__SV
`define REG_CASE__SV

class reg_case extends base_case;

`uvm_component_utils(reg_case);

function new(string name="reg_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(uvm_object_wrapper)::set(this,"vsqr.run_phase","default_sequence",reg_sequence::type_id::get());
  `uvm_info(get_type_name(),"configure phase",UVM_LOW);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

//task run_phase(uvm_phase phase);
//  sequence0 seq;
//  seq=sequence0::type_id::create("seq");
//  seq.starting_phase=phase;
//  seq.start(env.i_agt.sqr);
//endtask



endclass


`endif

