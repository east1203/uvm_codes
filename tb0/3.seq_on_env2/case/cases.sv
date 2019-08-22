`ifndef CASES__SV
`define CASES__SV

class case0 extends base_test;
  `uvm_component_utils(case0);

  function new(string name="case0",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
endclass

`endif
