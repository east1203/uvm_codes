`ifndef DRIVER
`define DRIVER
class driver extends uvm_component;

`uvm_component_utils(driver);

uvm_blocking_put_export#(transaction) drv_export;
uvm_blocking_put_imp#(transaction,driver) drv_tlm;
function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  drv_export=new("drv_export",this);
  drv_tlm = new("drv_tlm",this);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv_export.connect(drv_tlm);
endfunction

function void put(transaction tr);
  `uvm_info("driver","get a tr!!!",UVM_LOW);
  tr.print();
endfunction

endclass

`endif
