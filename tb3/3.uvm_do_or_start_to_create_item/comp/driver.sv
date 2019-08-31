`ifndef DRIVER__SV
`define DRIVER__SV

class driver extends uvm_driver#(transaction);

`uvm_component_utils(driver);
function new(string name="driver",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
string sqr_name;
  super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);

  `uvm_info(get_type_name(),"driver run",UVM_LOW);
  forever begin
    //seq_item_port.get_next_item(req);
    seq_item_port.try_next_item(req);
    if(req==null) begin
#100;
      `uvm_info(get_type_name(),"idle transaction",UVM_LOW);
      end
    else begin
      `uvm_info(get_type_name(),"driver get one tr",UVM_LOW);
      rsp=new("rsp");
#10;
      rsp.set_id_info(req);
      seq_item_port.item_done(rsp);
    end
  end
endtask

endclass

`endif
