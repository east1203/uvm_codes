`ifndef SEQUENCE1__SV
`define SEQUENCE1__SV

class sequence1 extends uvm_sequence#(transaction);
`uvm_object_utils(sequence1);

sequencer sqr_h;

function new(string name="sequence1");
  super.new(name);
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
  uvm_config_db#(sequencer)::get(null,get_full_name(),"sqr",sqr_h);
endtask

task body();
  transaction tr;
  repeat(5) begin
    `uvm_warning(get_type_name(),"start a sequence1");
    `uvm_do_on(tr,sqr_h);
  end 
endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
endtask

endclass

`endif
