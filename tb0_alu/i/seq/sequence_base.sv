`ifndef SEQUENCE_BASE__SV
`define SEQUENCE_BASE__SV

class sequence_base extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_base);

function new(string name="sequence_base");
  super.new(name);
endfunction

virtual task pre_start();
  if((get_parent_sequence()==null) && (starting_phase!=null)) begin
    starting_phase.raise_objection(this);
    `uvm_info({get_type_name(),"_seq"},{get_type_name()," raise objection"},UVM_LOW);
  end
endtask:pre_start
virtual task post_start();
  if((get_parent_sequence()==null) && (starting_phase!=null)) begin
    starting_phase.drop_objection(this);
    `uvm_info({get_type_name(),"_seq"},{get_type_name()," drop objection"},UVM_LOW);
  end
endtask:post_start

endclass:sequence_base

`endif
