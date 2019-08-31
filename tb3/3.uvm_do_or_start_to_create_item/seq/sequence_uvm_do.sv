`ifndef SEQUENCE_UVM_DO__SV
`define SEQUENCE_UVM_DO__SV


class sequence_uvm_do0 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_uvm_do0);

function new(string name="sequence_uvm_do0");
  super.new(name);
endfunction

task body();
  transaction tr;
  repeat(5) begin
    #10;
    `uvm_info(get_type_name(),"sequence sequence_uvm_do0 0 ",UVM_LOW);
  end 
endtask

endclass
class sequence_uvm_do1 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_uvm_do1);

function new(string name="sequence_uvm_do1");
  super.new(name);
endfunction

task body();
  transaction tr;
  repeat(5) begin
    #10;
    `uvm_info(get_type_name(),"sequence uvm_do 1 ",UVM_LOW);
  end 
endtask

endclass

class sequence_uvm_do extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_uvm_do);
`uvm_declare_p_sequencer(sequencer);

  sequence_uvm_do0 seq0;
  sequence_uvm_do1 seq1;

function new(string name="sequence_uvm_do");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
endtask

task body();

  `uvm_create(seq0);
  `uvm_create(seq1);
  fork
    seq0.start(p_sequencer);
    seq1.start(p_sequencer);
  join

endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
endtask

endclass





`endif
