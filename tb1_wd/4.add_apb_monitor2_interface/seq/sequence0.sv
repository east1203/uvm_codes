`ifndef SEQUENCE__SV
`define SEQUENCE__SV

class sequence0 extends uvm_sequence#(transaction);
`uvm_object_utils(sequence0);

function new(string name="sequence0");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
 `uvm_info("sequence0","do pre_body()",UVM_LOW);
endtask

task body();
  transaction tr;
  repeat(5) begin
    `uvm_do(tr);
    `uvm_info("sequence0","sequence0 create a tr",UVM_LOW);
    tr.print();
  end 
endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
 `uvm_info("sequence0","do post_body()",UVM_LOW);
endtask

endclass


`endif
