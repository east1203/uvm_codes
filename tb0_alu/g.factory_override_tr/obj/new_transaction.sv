`ifndef NEW_TR
`define NEW_TR

class new_transaction extends transaction;

`uvm_object_utils(new_transaction);

constraint con_op{
  op dist{
    no_op :=0,
    add_op:=1,
    and_op:=1,
    xor_op:=1,
    mul_op:=0,
    rst_op:=0           
  };
}

constraint con_data{
  A dist {
    'h00:=0,
     'h01:=1,
    ['h02:'hfe]:=0,
    'hff:=1 
  };
  B dist {'h00:=1,['h01:'hfe]:=1,'hff:=1};
}

endclass



`endif
