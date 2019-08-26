

`ifndef TB_PKG__SV
`define TB_PKG__SV

package tb_pkg;

`include "uvm_macros.svh"

import uvm_pkg::*;

`include  "transaction.sv"
`include "sequence0.sv"
`include "driver.sv"
`include "monitor_apb.sv"
`include "sequencer.sv"
`include "agent.sv"
`include "enviroment.sv"
`include "default_case.sv"
`include "base_case.sv"
`include "case0.sv"

endpackage


`endif





