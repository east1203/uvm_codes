`ifndef VSEQUENCE__SV
`define VSEQUENCE__SV

typedef class sequencer;
typedef class vsequencer;
class vsequence extends uvm_sequence;

`uvm_object_utils(vsequence);
`uvm_declare_p_sequencer(vsequencer);

reg_sequence seq;

function new(string name="vsequence");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
 `uvm_info(get_type_name(),"do pre_body()",UVM_LOW);
endtask

task body();
  `uvm_do_on(seq,p_sequencer.sqr);
endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
 `uvm_info(get_type_name(),"do post_body()",UVM_LOW);
endtask


endclass

`endif
