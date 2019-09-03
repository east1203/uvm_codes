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
function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  set_report_verbosity_level_hier(UVM_LOW);
endfunction
function void start_of_simulation_phase(uvm_phase phase);
  super.start_of_simulation_phase(phase);
  if(uvm_report_enabled(UVM_MEDIUM,UVM_INFO,"TOPOLOGY")) begin
    uvm_root::get().print_topology();
  end
  if(uvm_report_enabled(UVM_MEDIUM,UVM_INFO,"TOPOLOGY")) begin
    uvm_factory::get().print();
  end
endfunction

endclass

`endif
