
package tb_pkg;
  import uvm_pkg::*;

typedef enum bit[2:0]{
  no_op = 3'b000,
  add_op = 3'b001,
  and_op = 3'b010,
  xor_op = 3'b011,
  mul_op = 3'b100,
  rst_op = 3'b111
} operation_t;


  `include "uvm_macros.svh"

  `include "result_transaction.sv"
  `include "transaction.sv"
  `include "sequence0.sv"
  `include "sequencer.sv"
  `include "driver.sv"
  `include "command_monitor.sv"
  `include "agent.sv"
  `include "env.sv"
  `include "base_test.sv"
  `include "cases.sv"


endpackage


