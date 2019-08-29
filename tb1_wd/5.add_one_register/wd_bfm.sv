`ifndef WD_BFM__SV
`define WD_FFM__SV

interface wd_bfm;

import tb_pkg::*;

logic pclk;
logic preset_n;           
logic pwrite;
logic psel;
logic penable;
logic [7:0] paddr;
logic [31:0] pwdata;
logic [31:0] prdata;
logic timeout;
logic intr;

initial begin
  pclk=0;
  forever #10 pclk = ~pclk;
end

task reset;
  preset_n=0;
  @(negedge pclk);
  @(negedge pclk);
  preset_n=1;
endtask

task drive_one_pkg(transaction tr);
  // every delay_num cycles >> penable=1'b1
  // driver at negedge pclk
  repeat(tr.delay_num) @(negedge pclk);
  @(negedge pclk);
  psel=1'b1;
  penable=1'b1;
  pwrite=(tr.pwrite==WRITE)?1:0;
  paddr=tr.paddr;
  pwdata=(tr.pwrite==WRITE)?tr.pwdata:0;
  // delay one clk
  @(negedge pclk);
  @(posedge pclk);
  psel=1'b0;
  penable=1'b0;
//  @(posedge pclk);
  @(negedge pclk);
  
  if(tr.pwrite==READ)//read data
    tr.prdata=bfm.prdata;
  repeat(1) @(posedge pclk);
endtask

function op pwrite2enum();
  case(pwrite)
  1: return WRITE;
  0: return READ;
  endcase
endfunction



// monitor collect pkg;
monitor_apb mon_apb_bfm;

transaction tr;
always@(posedge pclk) begin
  if((psel==1'b1 && penable==1'b1)) begin
    tr=new("tr");
    tr.pwrite=pwrite2enum();
    tr.paddr=paddr;
    tr.pwdata=pwdata;
    mon_apb_bfm.collect_one_pkg(tr);
  end
end


endinterface

`endif
