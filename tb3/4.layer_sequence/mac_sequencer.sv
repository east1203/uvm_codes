`ifndef MAC_SEQUENCER__SV
`define MAC_SEQUENCER__SV

class mac_sequencer extends uvm_sequencer#(mac_transaction);
  `uvm_component_utils(mac_sequencer);

  uvm_seq_item_pull_port#(ip_transaction) ip_tr_port;

  function new(string name="mac_sequencer",uvm_component parent=null);
    super.new(name,parent);
    ip_tr_port=new("ip_tr_port",this);
  endfunction
endclass

`endif
