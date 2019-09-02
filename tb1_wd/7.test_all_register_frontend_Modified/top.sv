
`include "uvm_macros.svh"

module top;

import uvm_pkg::*;
import tb_pkg::*;

wd_bfm bfm();

wd_top u_wd(
    .pclk   (bfm.pclk),
    .prst_  (bfm.preset_n),
    .pwrite (bfm.pwrite),
    .psel   (bfm.psel),
    .penable(bfm.penable)            ,
    .paddr  (bfm.paddr)            ,
    .pwdata (bfm.pwdata)            ,
    .prdata (bfm.prdata)            ,
    .timeout(bfm.timeout)            ,
    .intr   (bfm.intr)                  
    );                        
                              

initial begin
  uvm_config_db#(virtual wd_bfm)::set(null,"uvm_test_top.env.i_agt","bfm",bfm);
  run_test();
end



initial begin
  $vcdpluson;
end
                             
endmodule



