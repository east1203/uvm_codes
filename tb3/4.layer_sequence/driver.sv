`ifndef DRIVER__SV
`define DRIVER__SV

class driver extends uvm_driver#(mac_transaction);

`uvm_component_utils(driver);

function new(string name="drv",uvm_component parent=null);
  super.new(name,parent);
endfunction:new

task run_phase(uvm_phase phase);
  forever begin
    seq_item_port.get_next_item(req);
    `uvm_info(get_type_name(),{$sformatf("%m"),"driver a item"},UVM_LOW);
#10;
    rsp=new("rsp");
    void'($cast(rsp,req));
    seq_item_port.item_done();
    seq_item_port.put_response(rsp);
  end
endtask

endclass


`endif
