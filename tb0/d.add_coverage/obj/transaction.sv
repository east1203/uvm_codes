`ifndef TRANSACTION
`define TRANSACTION

class transaction extends uvm_sequence_item;

  rand bit[7:0] A;
  rand bit[7:0] B;
  rand operation_t op;
  shortint unsigned result;


  constraint con_op{
    op dist {
      no_op:=0,
      add_op:=5,
      and_op:=5,
      xor_op:=5,      
      mul_op:=0,
      rst_op:=0
    };
  }

  constraint con_data {
    A dist{8'h00:=1,[8'h01:8'hfe]:=1,8'hff:=1};
    B dist{8'h00:=1,[8'h01:8'hfe]:=1,8'hff:=1};
  }

  function new(string name = "transaction");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(transaction)
    `uvm_field_int(A,UVM_ALL_ON)
    `uvm_field_int(B,UVM_ALL_ON)
    `uvm_field_enum(operation_t,op,UVM_ALL_ON)
  `uvm_object_utils_end


endclass


`endif
