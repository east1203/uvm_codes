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
  @(posedge pclk);
  @(posedge pclk);
  preset_n=1;
endtask

task drive_one_pkg(transaction tr);
  psel=1'b1;
  // every delay_num cycles >> penable=1'b1
  // driver at negedge pclk
  repeat(tr.delay_num) @(negedge pclk);
  penable=1'b1;
  pwrite=tr.pwrite;
  pwdata=tr.pwdata;
  paddr=tr.paddr;
  // delay one clk
  @(negedge pclk);
  @(posedge pclk);
  if(tr.pwrite==1'b0)
    tr.prdata=bfm.prdata;
  psel=1'b0;
  penable=1'b0;
  repeat(2) @(posedge pclk);
endtask

monitor_apb mon_apb_bfm;

transaction tr;
always@(posedge pclk) begin
  if((psel==1'b1 && penable==1'b1)) begin
    tr=new("tr");
    tr.pwrite=pwrite;
    tr.paddr=paddr;
    tr.pwdata=pwdata;
    mon_apb_bfm.collect_one_pkg(tr);
  end
end


endinterface

`endif
