`ifndef BASE_CASE__SV
`define BASE_CASE__SV

class base_case extends uvm_test;

`uvm_component_utils(base_case);

enviroment env;

function new(string name="base_test",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

  
  env=enviroment::type_id::create("env",this);
endfunction

//function void end_of_elaboration_phase(uvm_phase phase);
//  uvm_config_db#(uvm_object_wrapper)::set(this,"env.ip_sqr.run_phase","default_phase",ip_sequence::get_type());
//  uvm_config_db#(uvm_object_wrapper)::set(this,"env.sqr.run_phase","default_phase",sequence_base::get_type());
//endfunction 

//task run_phase(uvm_phase phase);
//  sequence_base seq;
//  super.run_phase(phase);
//  seq=new("seq");
//  seq.starting_phase=phase;
//  seq.start(this.env.sqr);
//endtask 

endclass


`endif
