`ifndef USER_CB__SV
`define USER_CB__SV

class user_cb extends driver_cb;

`uvm_object_utils(user_cb);

function new(string name="user_cb");
  super.new(name);
endfunction

virtual task pre_cb(ref transaction tr);
  `uvm_info("user_cb","call pre_cb",UVM_LOW);
  tr.op=add_op;
endtask

virtual task post_cb();
  `uvm_info("user_cb","call post_cb",UVM_LOW);
endtask


endclass


`endif
