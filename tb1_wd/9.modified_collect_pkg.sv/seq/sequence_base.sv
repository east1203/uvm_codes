`ifndef SEQUENCE_BASE__SV
`define SEQUENCE_BASE__SV

class sequence_base extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_base);

function new(string name="sequence_base");
  super.new(name);
endfunction

virtual task pre_body;
  if(starting_phase !== null) begin
    starting_phase.raise_objection(this);
    `uvm_info(get_type_name(),$sformatf("%s pre_body raising %s objection",get_sequence_path(),starting_phase.get_name()),UVM_MEDIUM)
  end
endtask

virtual task post_body;
  if(starting_phase !== null) begin
    starting_phase.drop_objection(this);
    `uvm_info(get_type_name(),$sformatf("%s pre_body raising %s objection",get_sequence_path(),starting_phase.get_name()),UVM_MEDIUM)
    end
endtask

endclass


`endif
