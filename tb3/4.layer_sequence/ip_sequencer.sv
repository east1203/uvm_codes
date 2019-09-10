`ifndef IP_SEQUENCER__SV
`define IP_SEQUENCER__SV

class ip_sequencer extends uvm_sequencer#(ip_transaction);
`uvm_component_utils(ip_sequencer);

function new(string name="ip_qr",uvm_component parent=null);
  super.new(name,parent);
endfunction




endclass



`endif
