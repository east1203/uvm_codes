`ifndef CASES__SV
`define CASES__SV

class case0 extends base_test;
  `uvm_component_utils(case0);

  function new(string name="case0",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
   // sequence0 seq0;
    super.build_phase(phase);
    uvm_config_db#(uvm_object_wrapper)::set(this,"env0.sqr.run_phase","default_sequence",sequence0::type_id::get());
    //seq0=sequence0::type_id::create("seq0");
    //uvm_config_db#(uvm_sequence_base)::set(this,"env0.sqr.run_phase","default_sequence",seq0);
  endfunction

  task run_phase(uvm_phase phase);
//      sequence0 seq0;
  super.run_phase(phase);
//      seq0=sequence0::type_id::create("seq0");
//      seq0.starting_phase = phase;
//      seq0.start(env0.sqr);
  endtask
endclass

`endif