`ifndef SEQUENCE0__SV
`define SEQUENCE0__SV

class sequence0 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence0);
function new(string name="sequence0");
  super.new(name);
endfunction

  transaction tr;
task pre_body();
  if(starting_phase != null)
    starting_phase.raise_objection(this);
  `uvm_info("sequence0","pre_body",UVM_LOW)
endtask
task body();
  `uvm_info("sequence0","body",UVM_LOW)

  repeat(50) begin
    //`uvm_do(tr);
    //tr=new();
    `uvm_create(tr);
    //tr.con_op.constraint_mode(0);
    //tr.con_data.constraint_mode(0);
    assert(tr.randomize);
    `uvm_send(tr);
  end
#1000;
endtask
task post_body();
  `uvm_info("sequence0","post_body",UVM_LOW)
 if(starting_phase!=null)
    starting_phase.drop_objection(this);
endtask
endclass

`endif
