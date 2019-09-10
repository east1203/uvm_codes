`ifndef IP_SEQUENCE__SV
`define IP_SEQUENCE__SV

class ip_sequence extends uvm_sequence#(ip_transaction);

`uvm_object_utils(ip_sequence);

function new(string name="ip_sequence");
  super.new(name);
endfunction

task body();
  ip_transaction ip_tr;
  repeat(5) begin
    `uvm_do_with(ip_tr,{ip_tr.src_ip=='h9999;ip_tr.dest_ip=='h10000;}) 
#10;
    `uvm_info(get_type_name(),{$sformatf("%m")," send a ip_tr"},UVM_LOW);
  end
endtask

task pre_body();
// reference to Synopsys UVM LAB
  if(get_parent_sequence()==null && starting_phase!=null) begin
    starting_phase.raise_objection(this);
    `uvm_info(get_type_name(),$sformatf("%s starting phase raise %s phase",get_sequence_path(),starting_phase.get_name()),UVM_LOW);
    end
endtask
task post_body();
  if(get_parent_sequence()==null && starting_phase!=null) begin
    starting_phase.drop_objection(this);
    `uvm_info(get_type_name(),$sformatf("%s starting phase drop %s phase",get_sequence_path(),starting_phase.get_name()),UVM_LOW);
    end
endtask

endclass


`endif
