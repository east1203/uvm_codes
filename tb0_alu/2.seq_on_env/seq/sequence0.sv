`ifndef SEQUENCE0__SV
`define SEQUENCE0__SV

class sequence0 extends uvm_sequence#(transaction);

`uvm_object_utils(sequence0);
function new(string name="sequence0");
  super.new(name);
endfunction

virtual task body();
  
  transaction tr;
  repeat(2) begin
    #10;
    `uvm_do(tr);
  end
endtask


endclass

`endif
