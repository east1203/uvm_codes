`ifndef DRIVER__SV
`define DRIVER__SV

typedef class agent;
typedef class driver;

class driver_cb extends uvm_callback;
  `uvm_object_utils(driver_cb);
  function new(string name="driver_cb");

  endfunction
  virtual task trans_received(driver u_drv,transaction tr); endtask
  virtual task trans_executed(driver u_drv,transaction tr); endtask
endclass

class driver extends uvm_driver#(transaction);

`uvm_component_utils(driver);
`uvm_register_cb(driver,driver_cb);
virtual wd_bfm bfm;

function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  agent agt;
  super.build_phase(phase);
  if($cast(agt,get_parent()) && agt!==null) begin
    bfm=agt.bfm;
  end
  else begin
    if(!uvm_config_db#(virtual wd_bfm)::get(this,"","bfm",bfm))
      `uvm_fatal(get_type_name(),"Failed get bfm");
  end
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

task run_phase(uvm_phase phase);
transaction tr;
  bfm.reset(); //reset dut
  while(1) begin
    seq_item_port.get_next_item(req);
    tr=req;
    `uvm_do_callbacks(driver,driver_cb,trans_received(this,tr));
   // req.print();
    bfm.drive_one_pkg(req);
   // drive_one_pkg(req);
    $cast(rsp,req.clone());
    rsp.set_id_info(req);
    seq_item_port.item_done();
    `uvm_warning("driver","driver one pkg");
    seq_item_port.put_response(rsp);
    req.print();
  end
endtask

task drive_one_pkg(transaction tr);
  case(tr.pwrite)
  READ:   this.read(tr);
  WRITE:  this.write(tr);
  endcase
endtask
//read operation
virtual protected task read(ref transaction tr);
  bfm.psel=1'b1;
  bfm.paddr=tr.paddr;
  bfm.pwrite=1'b0;
  @(posedge bfm.pclk);
  bfm.penable=1'b1;
  @(posedge bfm.pclk);
  tr.prdata=bfm.prdata;
  bfm.psel=1'b0;
  bfm.penable=1'b0;
endtask
// write operation
virtual protected task write(ref transaction tr);
  bfm.psel=1'b1;
  bfm.paddr=tr.paddr;
  bfm.pwrite=1'b1;
  bfm.pwdata=tr.pwdata;
  @(posedge bfm.pclk);
  bfm.penable=1'b1;
  @(posedge bfm.pclk);
  bfm.psel=1'b0;
  bfm.penable=1'b0;
endtask

endclass

`endif
