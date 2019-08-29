`ifndef SEQUENCE0__SV
`define SEQUENCE0__SV

class sequence0 extends uvm_sequence#(transaction);
`uvm_object_utils(sequence0);

function new(string name="sequence0");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
endtask

task body();
  transaction tr;
  repeat(5) begin
    `uvm_do(tr);
  end 
endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
endtask

endclass


`endif
