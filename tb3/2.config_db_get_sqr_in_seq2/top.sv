
`include "uvm_macros.svh"

module top;

import uvm_pkg::*;
import pkg::*;

bfm bfm();

                              


initial begin

run_test();
end

initial begin
  $vcdpluson;
end
                              
endmodule



