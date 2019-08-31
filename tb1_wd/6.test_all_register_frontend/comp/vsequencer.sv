`ifndef VSEQUENCER__SV
`define VSEQUENCER__SV

class vsequencer extends uvm_sequencer;

`uvm_component_utils(vsequencer);

sequencer sqr;

reg_model rm;

function new(string name="vsequencer",uvm_component parent=null);
  super.new(name,parent);
endfunction


endclass

`endif
