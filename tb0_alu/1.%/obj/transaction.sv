`ifndef TRANSACTION
`define TRANSACTION

class transaction extends uvm_sequence_item;

  rand bit[7:0] dmac;
  rand bit[7:0] smac;
  rand byte pload[];

  constraint c {
    pload.size >= 100;
    pload.size <=200;
  }

  function new(string name = "transaction");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(transaction)
    `uvm_field_int(dmac,UVM_ALL_ON)
    `uvm_field_int(dmac,UVM_ALL_ON)
    `uvm_field_array_int(pload,UVM_ALL_ON)
  `uvm_object_utils_end


endclass


`endif
