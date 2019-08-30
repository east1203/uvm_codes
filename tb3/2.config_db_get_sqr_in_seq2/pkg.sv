

`ifndef PKG__SV
`define PKG__SV

package pkg;

`include "uvm_macros.svh"

import uvm_pkg::*;

`include  "transaction.sv"
`include "sequencer.sv"
`include "sequence0.sv"
`include "sequence1.sv"
`include "driver.sv"
`include "enviroment.sv"
`include "default_case.sv"
`include "base_case.sv"
`include "case.sv"

endpackage


`endif





