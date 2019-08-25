`ifndef DRIVER
`define DRIVER
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
  `uvm_info("driver","run_phase",UVM_LOW);
  while(1) begin
    seq_item_port.get_next_item(req);
    req.print();
    seq_item_port.item_done();
  end
endtask

endclass

`endif
