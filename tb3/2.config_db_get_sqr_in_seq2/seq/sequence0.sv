`ifndef SEQUENCE0__SV
`define SEQUENCE0__SV

class sequence0 extends uvm_sequence#(transaction);
`uvm_object_utils(sequence0);

function new(string name="sequence0");
  super.new(name);
endfunction


task body();
  transaction tr;
  repeat(5) begin
    `uvm_do(tr);
  end 
endtask

endclass

class vsequence extends uvm_sequence#(transaction);
`uvm_object_utils(vsequence);
uvm_component component_h;
sequencer sequencer_h;
function new(string name="vsequence");
  super.new(name);
  //component_h = uvm_top.find("*.env.sqr");
  //if(!$cast(sequencer_h,component_h))
  //  `uvm_fatal(get_type_name(),"cast errror");
endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
endtask

task body();
  sequence0 seq0;

  uvm_resource#(sequencer) sqr_c;
  uvm_sequencer#(transaction) sqr_h;
  uvm_config_db#(sequencer)::get(null,get_full_name(),"sqr",sequencer_h);
 // if(!$cast(sequencer_h,sqr_h))
 //   `uvm_fatal(get_type_name(),"Failed get sqr");
 // sqr_h=uvm_top.find("*.env.sqr");
 // sqr_c= uvm_resource_db#(sequencer)::get_by_type("sqr");
//  sequencer_h= sqr_c.read(sqr_h);

  //if(!uvm_config_db#(sequencer)::get(null,get_full_name(),"sqr",sqr))
  //  `uvm_fatal(get_type_name(),"Failed get sequencer");
  // sqr_name=sqr.get_full_name(); 
    `uvm_info(get_type_name(),"vsequence start a seq",UVM_LOW);
    `uvm_do_on(seq0,sequencer_h);
endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
endtask

endclass

`endif
