`ifndef SEQ_FABONACCI__SV
`define SEQ_FABONACCI__SV

class seq_fabonacci extends uvm_sequence;

`uvm_object_utils(seq_fabonacci);

function new(string name="seq_fabonacci");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase != null)
    starting_phase.raise_objection(this);
  `uvm_info("sequence0","pre_body",UVM_LOW)
endtask
transaction fab_tr;
task body();
  shortint unsigned tmp1,tmp2;
  `uvm_do_with(fab_tr,{fab_tr.A==1;fab_tr.B==1;fab_tr.op==add_op;});
  tmp1=1;
  tmp2=fab_tr.result;
  repeat(20) begin
    `uvm_do_with(fab_tr,{fab_tr.A==tmp1;fab_tr.B==tmp2;fab_tr.op==add_op;});
    tmp1=fab_tr.B;
    tmp2=fab_tr.result;
  end
  
endtask

task post_body();
  `uvm_info("sequence0","post_body",UVM_LOW)
  if(starting_phase != null)
    starting_phase.drop_objection(this);
endtask

endclass



`endif
