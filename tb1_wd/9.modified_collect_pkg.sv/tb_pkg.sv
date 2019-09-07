

`ifndef TB_PKG__SV
`define TB_PKG__SV

package tb_pkg;

`include "uvm_macros.svh"

import uvm_pkg::*;

`include  "transaction.sv"
`include "sequence_base.sv"
`include "sequence0.sv"
`include "reg_sequence.sv"
`include "backdoor_seq.sv"
`include "vsequence.sv"
`include "reg_model.sv"

`include "driver.sv"
`include "monitor_apb.sv"
`include "sequencer.sv"
`include "vsequencer.sv"
`include "agent.sv"
`include "enviroment.sv"

`include "default_case.sv"
`include "base_case.sv"
`include "case0.sv"
`include "reg_case.sv"
`include "backdoor_case.sv"

endpackage


`endif





