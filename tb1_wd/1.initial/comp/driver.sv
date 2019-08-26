`ifndef DRIVER__SV
`define DRIVER__SV

class driver extends uvm_driver#(transaction);

`uvm_component_utils(driver);
virtual wd_bfm bfm;

function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  if(!uvm_config_db#(virtual wd_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("driver","Failed get bfm!!!");
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

task run_phase(uvm_phase phase);
  bfm.reset(); //reset dut
  while(1) begin
    seq_item_port.get_next_item(req);
   // req.print();
    bfm.drive_one_pkg(req);
   // drive_one_pkg(req);
    seq_item_port.item_done();
    `uvm_warning("driver","driver one pkg");
  end
endtask

//task drive_one_pkg(transaction tr);
//  bfm.psel=1'b1;
//  @(posedge bfm.pclk);
//  bfm.penable=1'b1;
//  bfm.pwrite=tr.pwrite;
//  bfm.paddr=tr.paddr;
//  bfm.pwdata=tr.pwdata;
//  if(tr.pwrite==1'b0)
//    tr.prdata=bfm.prdata;
//  @(posedge bfm.pclk)
//  bfm.psel=1'b0;
//  bfm.penable=1'b0;
//
//endtask

endclass

`endif
