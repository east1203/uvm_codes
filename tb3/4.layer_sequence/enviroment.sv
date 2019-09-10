`ifndef ENVI__SV
`define ENVI__SV

class enviroment extends uvm_env;

`uvm_component_utils(enviroment);

ip_sequencer ip_sqr;
mac_sequencer sqr;
driver drv;

function new(string name="enviroment",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  ip_sqr = ip_sequencer::type_id::create("ip_sqr",this);
  sqr=mac_sequencer::type_id::create("sqr",this);
  drv=driver::type_id::create("drv",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
  sqr.ip_tr_port.connect(ip_sqr.seq_item_export); 
endfunction

endclass

`endif

