`ifndef MONITOR_APB__SV
`define MONITOR_APB__SV
typedef class agent;
class monitor_apb extends uvm_monitor;

`uvm_component_utils(monitor_apb);

uvm_analysis_port#(transaction) ap;

virtual wd_bfm bfm;

function new(string name="apb_monitor",uvm_component parent=null);
  super.new(name,parent);
  ap=new("ap",this);
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

//task collect_one_pkg(ref transaction tr);
//  transaction apb_tr;
//  apb_tr=new("apb_tr");
//  apb_tr=tr;
//  ap.write(apb_tr);
//  `uvm_warning("monitor_apb","monitor apb collect one pkg");
//endtask
function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  bfm.mon_apb_bfm=this;
endfunction

task run_phase(uvm_phase phase);
  transaction apb_tr;
  super.run_phase(phase);
  while(1) begin
    apb_tr=new("apb_tr");
   // collect_one_pkg(apb_tr);
    data_detect(apb_tr); // ************* (new)
    ap.write(apb_tr);
    `uvm_info("monitor_apb","monitor_apb collect one pkg",UVM_LOW);
    apb_tr.print();
  end
endtask
// ************* (new)
task data_detect(ref transaction tr);
  fork
    fork
      wr_detect(tr);
      rd_detect(tr);
    join_any
    disable fork;
  join
endtask
// ************* (new)
task wr_detect(ref transaction tr);
  @(posedge bfm.pclk);
  wait((bfm.psel==1'b1) && (bfm.penable==1'b1));
  wait(bfm.pwrite==1'b1);
  tr.pwrite=(bfm.pwrite==1'b1)?WRITE:READ;
  tr.pwdata=bfm.pwdata;
  tr.paddr=bfm.paddr;
  wait((bfm.psel==1'b0) || (bfm.penable==1'b0));
  bfm.prdata=tr.prdata;
endtask
// ************* (new)
task rd_detect(ref transaction tr);
  @(posedge bfm.pclk);
  wait((bfm.psel==1'b1) && (bfm.penable==1'b1));
  wait(bfm.pwrite==1'b0);
  tr.pwrite=(bfm.pwrite==1'b1)?WRITE:READ;
  tr.prdata=bfm.prdata;
  tr.paddr=bfm.paddr;
  wait((bfm.psel==1'b0) || (bfm.penable==1'b0));
endtask

//task collect_one_pkg(ref transaction tr);
//  @(posedge bfm.pclk);
//  while(1) begin
//    if((bfm.psel==1'b1) && (bfm.penable==1'b1))
//      break;
//    @(posedge bfm.pclk);
//  end
//  begin
//    tr.pwrite=(bfm.pwrite==1'b1)?WRITE:READ;
//    tr.paddr=bfm.paddr;
//    tr.pwdata=bfm.pwdata;
////    @(negedge bfm.penable);
//  end
//    while(1) begin
//      @(negedge bfm.pclk);
//      if(bfm.penable==1'b0) break; 
//    end
//    tr.prdata=bfm.prdata;
//endtask

endclass

`endif
