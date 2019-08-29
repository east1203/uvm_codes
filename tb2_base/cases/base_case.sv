`ifndef BASE_CASE__SV
`define BASE_CASE__SV


class base_case extends uvm_test;
  
`uvm_component_utils(base_case);

enviroment env;

function new(string name="base_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  env=enviroment::type_id::create("env",this);
endfunction 


endclass


`endif
