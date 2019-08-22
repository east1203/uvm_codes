`ifndef RESULT_TRANSACTION
`define RESULT_TRANSACTION

class result_transaction extends uvm_sequence_item;

shortint unsigned result;

`uvm_object_utils_begin(result_transaction)
  `uvm_field_int(result,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="");
  super.new(name);
endfunction:new

endclass


`endif
