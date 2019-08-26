`ifndef TRANSACTION__SV
`define TRANSACTION__SV

class transaction extends uvm_sequence_item;

rand bit pwrite;
rand bit [7:0] paddr;
rand bit [7:0] pwdata;
bit [7:0] prdata;

// control delay between two transaction
rand bit[15:0] delay_num;

`uvm_object_utils_begin(transaction);
  `uvm_field_int(pwrite,UVM_ALL_ON)
  `uvm_field_int(paddr ,UVM_ALL_ON)
  `uvm_field_int(pwdata,UVM_ALL_ON)
  `uvm_field_int(prdata,UVM_ALL_ON)
  `uvm_field_int(delay_num,UVM_ALL_ON|UVM_NOPACK)
`uvm_object_utils_end

constraint con {
  delay_num inside {[100:1000]};
}

constraint con_sig{
  pwrite  inside {[0:1]};
  paddr   inside {'h00,'h08,'h10};
}
constraint data{
  pwdata  dist{'h00:=1,['h01:'hfe]:=1,'hff:=1};
//  prdata  dist{'h00:=1,['h01:'hfe]:=1,'hff:=1};
}


function new(string name="transaction");
  super.new(name);
endfunction




endclass


`endif
