`ifndef BASE_TEST__SV
`define BASE_TEST__SV

class base_test extends uvm_test;

`uvm_component_utils(base_test);

env env0;

function new(string name="base_test",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  env0=env::type_id::create("env0",this);
endfunction


endclass

`endif
