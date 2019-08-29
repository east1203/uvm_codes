`ifndef DEFAULT_CASE__SV
`define DEFAULT_CASE__SV

class default_case extends uvm_test;

`uvm_component_utils(default_case);

function new(string name="default_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  `uvm_warning("default_case","Please using ** make case+you_case_name **");
endfunction

endclass


`endif
