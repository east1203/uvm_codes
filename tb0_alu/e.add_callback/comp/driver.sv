`ifndef DRIVER
`define DRIVER
class driver extends uvm_driver#(transaction);

`uvm_component_utils(driver);
virtual alu_bfm bfm;

// add callback
`uvm_register_cb(driver,driver_cb);

function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual alu_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("driver","driver can not get bfm!!!");
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);
  `uvm_info("driver","run_phase",UVM_LOW);
  bfm.reset_alu();
  while(1) begin
    seq_item_port.get_next_item(req);
    //req.print();
    `uvm_do_callbacks(driver,driver_cb,pre_cb(req));
    bfm.drive_one_pkg(req);
    `ifdef `CALLBACK_PRINT
    req.print();
    `endif
    seq_item_port.item_done();
    `uvm_do_callbacks(driver,driver_cb,post_cb());
  end
endtask


endclass

`endif
