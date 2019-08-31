`ifndef SEQUENCE_START__SV
`define SEQUENCE_START__SV


class sequence_start0 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_start0);

function new(string name="sequence_start0");
  super.new(name);
endfunction

task body();
  transaction tr;
  repeat(5) begin
    #10;
    `uvm_info(get_type_name(),"sequence start 0 ",UVM_LOW);
  end 
endtask

endclass
class sequence_start1 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_start1);

function new(string name="sequence_start1");
  super.new(name);
endfunction

task body();
  transaction tr;
  repeat(5) begin
    #10;
    `uvm_info(get_type_name(),"sequence start 1 ",UVM_LOW);
  end 
endtask

endclass

class sequence_start extends uvm_sequence#(transaction);

`uvm_object_utils(sequence_start);
`uvm_declare_p_sequencer(sequencer);

  sequence_start0 seq0;
  sequence_start1 seq1;

function new(string name="sequence_start");
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
