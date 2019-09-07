`ifndef BASE_CASE__SV
`define BASE_CASE__SV


class base_case extends uvm_test;
  
`uvm_component_utils(base_case);
// ------------- (new)
string hdl_path;

enviroment env;
reg_model rm;
adapter reg_sqr_adapter;
vsequencer vsqr;

function new(string name="base_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  env=enviroment::type_id::create("env",this);
  vsqr=vsequencer::type_id::create("vsqr",this);
// ------------- (new)
  uvm_config_db#(string)::get(this,"","hdl_path",hdl_path);

  rm=reg_model::type_id::create("rm",this);
  rm.configure(null,"");
  rm.build();
  rm.lock_model();
  rm.reset();
// ------------- (new)
  rm.set_hdl_path_root(hdl_path);
  //rm.set_hdl_path_root("top.u_wd");
  reg_sqr_adapter=new("reg_sqr_adapter");
 // env.p_rm=this.rm
endfunction 

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  vsqr.sqr = env.i_agt.sqr;
  vsqr.rm=this.rm;
  rm.default_map.set_sequencer(env.i_agt.sqr,reg_sqr_adapter);
  rm.default_map.set_auto_predict(1);
endfunction

function void report_phase(uvm_phase phase);
  super.report_phase(phase);
  uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);
  phase.phase_done.set_drain_time(this,40);
endtask

endclass


`endif
