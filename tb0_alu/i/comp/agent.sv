`ifndef AGENT__SV
`define AGENT__SV

class agent extends uvm_agent;
`uvm_component_utils(agent);

driver drv;
sequencer sqr;
command_monitor c_mon;
result_monitor r_mon;

uvm_analysis_port#(transaction) ap;
uvm_analysis_port#(result_transaction) rap;
function new(string name="agent",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(is_active == UVM_ACTIVE) begin
    drv = driver::type_id::create("drv",this);
    sqr = sequencer::type_id::create("sqr",this);
    c_mon = command_monitor::type_id::create("c_mon",this);
  end
  else if(is_active == UVM_PASSIVE) begin
    r_mon = result_monitor::type_id::create("r_mont",this);
  end
endfunction

function void connect_phase(uvm_phase phase);
  if(is_active==UVM_ACTIVE) begin
    drv.seq_item_port.connect(sqr.seq_item_export);
    ap=c_mon.ap;
  end
  else if(is_active==UVM_PASSIVE) begin
    rap=r_mon.ap;
  end


endfunction
endclass

`endif
