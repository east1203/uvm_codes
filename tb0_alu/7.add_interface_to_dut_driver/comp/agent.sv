`ifndef AGENT__SV
`define AGENT__SV

class agent extends uvm_agent;
`uvm_component_utils(agent);

driver drv;
sequencer sqr;

function new(string name="agent",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  drv = driver::type_id::create("drv",this);
  sqr = sequencer::type_id::create("sqr",this);
endfunction

function void connect_phase(uvm_phase phase);
  if(is_active) begin
    drv.seq_item_port.connect(sqr.seq_item_export);
  end
endfunction
endclass

`endif
