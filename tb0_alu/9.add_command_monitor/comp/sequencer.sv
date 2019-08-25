`ifndef SEQUENCER__SV
`define SEQUENCER__SV
class sequencer extends uvm_sequencer#(transaction);

`uvm_component_utils(sequencer);


function new(string name="sequencer",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction

virtual task main_phase(uvm_phase phase);
  super.main_phase(phase);
endtask
virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
endtask
endclass:sequencer


`endif         
