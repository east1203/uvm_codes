`ifndef DRIVER_CB__SV
`define DRIVER_CB__SV

class driver_cb extends uvm_callback;

`uvm_object_utils(driver_cb);

function new(string name="driver_cb");
  super.new(name);
endfunction

virtual task pre_cb(ref transaction tr);

endtask

virtual task post_cb();

endtask

endclass


`endif
