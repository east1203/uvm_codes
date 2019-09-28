`ifndef AGENT__SV
`define AGENT__SV


class agent extends uvm_agent;


driver drv;
sequencer sqr;
monitor_apb mon_apb;

uvm_analysis_port#(transaction) ap_apb;

virtual wd_bfm bfm;

`uvm_component_utils_begin(agent)
  `uvm_field_object(drv,UVM_DEFAULT)
  `uvm_field_object(sqr,UVM_DEFAULT)
  `uvm_field_object(mon_apb,UVM_DEFAULT)
`uvm_component_utils_end

function new(string name="agent",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  `uvm_info("agent","agent build_phase",UVM_LOW);
  if(!uvm_config_db#(virtual wd_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal(get_type_name(),"Failed get bfm");
 // if(uvm_config_db#(uvm_active_passive_enum)::get(this,"","is_active",is_active))
 //     `uvm_fatal("agent","Failed get is_active");
  if(is_active==UVM_ACTIVE) begin
    drv=driver::type_id::create("drv",this);
    sqr=sequencer::type_id::create("sqr",this);
    mon_apb=monitor_apb::type_id::create("mon_apb",this);
  end
  else if(is_active==UVM_PASSIVE) begin
  
  end


endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
  if(is_active==UVM_ACTIVE) begin
    ap_apb=mon_apb.ap;
  end
endfunction


endclass

`endif
