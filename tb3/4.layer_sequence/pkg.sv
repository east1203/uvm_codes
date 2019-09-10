`ifndef PKG__SV
`define PKG__SV

package pkg;
//`include "uvm_macros.svh"
import uvm_pkg::*;

`include "ip_transaction.sv"
`include "mac_transaction.sv"
`include "driver.sv"
`include "mac_sequencer.sv"
`include "ip_sequencer.sv"
`include "mac_sequence.sv"
`include "ip_sequence.sv"
`include "enviroment.sv"
`include "base_case.sv"
`include "case.sv"



endpackage



`endif
