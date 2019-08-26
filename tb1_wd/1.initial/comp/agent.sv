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
  `uvm_info("agent","agent build_phase",UVM_LOW);
 // if(uvm_config_db#(uvm_active_passive_enum)::get(this,"","is_active",is_active))
 //     `uvm_fatal("agent","Failed get is_active");
  if(is_active==UVM_ACTIVE) begin
    drv=driver::type_id::create("drv",this);
    sqr=sequencer::type_id::create("sqr",this);
  end
  if(is_active==UVM_PASSIVE) begin
  
  end


endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
endfunction


endclass

`endif
