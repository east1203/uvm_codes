`ifndef DRIVER__SV
`define DRIVER__SV

class driver extends uvm_driver#(transaction);

`uvm_component_utils(driver);

function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);

  super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);

endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);

endtask

endclass

`endif
