`ifndef SEQUENCER__SV
`define SEQUENCER__SV
class sequencer extends uvm_component;

`uvm_component_utils(sequencer);

uvm_blocking_put_port#(transaction) sqr_port;

function new(string name="sequencer",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  sqr_port = new("sqr_port",this);
endfunction

virtual task main_phase(uvm_phase phase);
  transaction tr;
  super.main_phase(phase);

  repeat(5) begin
  #10;
  tr=new("tr");
  assert(tr.randomize())
  sqr_port.put(tr);
 end 
endtask

endclass:sequencer


`endif         
