
`ifndef SEQUENCER__SV
`define SEQUENCER__SV

class sequencer extends uvm_sequencer#(transaction);

`uvm_component_utils(sequencer);

function new(string name="sequencer",uvm_component parent=null);
  super.new(name,parent);
endfunction


//function void connect_phase(uvm_phase phase);
//  super.connect_phase(phase);
//endfunction


endclass

`endif
