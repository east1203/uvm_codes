`ifndef CB_CASE__SV
`define CB_CASE__SV
class cb_case extends base_test;

`uvm_component_utils(cb_case);

user_cb callback;
function new(string name="cb_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

  uvm_config_db#(uvm_object_wrapper)::set(this,"env0.i_agt.sqr.run_phase","default_sequence",sequence0::type_id::get());
endfunction
function void connect_phase(uvm_phase phase);
  super.connect_phase(phase); //add connect
  callback=user_cb::type_id::create("callback",this);
  uvm_callbacks#(driver,driver_cb)::add(env0.i_agt.drv,callback);
endfunction

endclass

`endif
