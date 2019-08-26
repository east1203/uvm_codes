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
logic [7:0] pwdata;
logic [7:0] prdata;
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
  @(posedge pclk);
  penable=1'b1;
  pwrite=tr.pwrite;
  pwdata=tr.pwdata;
  paddr=tr.paddr;
  if(tr.pwrite==1'b0)
    tr.prdata=bfm.prdata;
  @(posedge pclk);
  psel=1'b0;
  penable=1'b0;
endtask

endinterface

`endif
