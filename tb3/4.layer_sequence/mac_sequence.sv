`ifndef SEQUENCE_BASE__SV
`define SEQUENCE_BASE__SV

typedef class ip_sequence;

class mac_sequence extends uvm_sequence#(mac_transaction);

`uvm_object_utils(mac_sequence);
`uvm_declare_p_sequencer(mac_sequencer);

function new(string name="mac_sequence");
  super.new(name);
endfunction

task body();
  ip_transaction ip_tr;
  byte unsigned data_q[];
  int data_size;
  forever begin
    p_sequencer.ip_tr_port.get_next_item(ip_tr);
    `uvm_info(get_type_name(),"get a ip_tr",UVM_LOW);
    data_size = ip_tr.pack_bytes(data_q)/8;
    req=new("req");
    assert(req.randomize() with {req.pload.size()==data_size;});
    foreach(data_q[i]) begin
      req.pload[i] = data_q[i];
    end
    `uvm_send(req);
    `uvm_info(get_type_name(),"mac_sequence send a item",UVM_LOW);
    p_sequencer.ip_tr_port.item_done();
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
