`ifndef CASE0__SV
`define CASE0__SV

class case0 extends base_case;
`uvm_component_utils(case0);

function new(string name="case0",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  //uvm_config_db#(uvm_object_wrapper)::set(this,"env.i_agt.sqr.run_phase","default_sequence",sequence0::type_Id::get());
  //uvm_resource_db#(sequencer)::set("sqr","*",env.sqr,this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  uvm_config_db#(sequencer)::set(null,"*","sqr",env.sqr);
endfunction

task run_phase(uvm_phase phase);
  sequence1 seq1;
  super.run_phase(phase);
  seq1=new("seq1");
  seq1.starting_phase=phase;
  seq1.start(null);
endtask


endclass

`endif
