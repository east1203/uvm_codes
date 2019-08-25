
module top;

import uvm_pkg::*;
import tb_pkg::*;

`include "uvm_macros.svh"

alu_bfm bfm();
tinyalu DUT(.clk(bfm.clk),
        .reset_n(bfm.reset_n),
        .A(bfm.A),
        .B(bfm.B),
        .op(bfm.op),
        .start(bfm.start),
        .result(bfm.result),
        .done(bfm.done)
        );

initial begin
  uvm_config_db#(virtual alu_bfm)::set(null,"*","bfm",bfm); 
  run_test();
end
endmodule



