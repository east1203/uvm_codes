

`ifndef PKG__SV
`define PKG__SV

package pkg;

`include "uvm_macros.svh"

import uvm_pkg::*;

`include  "transaction.sv"
`include "sequencer.sv"
`include "sequence0.sv"
`include "sequence_uvm_do.sv"
`include "sequence_start.sv"
`include "driver.sv"
`include "enviroment.sv"
`include "default_case.sv"
`include "base_case.sv"
`include "case.sv"
`include "uvm_do_case.sv"
`include "start_case.sv"

endpackage


`endif





