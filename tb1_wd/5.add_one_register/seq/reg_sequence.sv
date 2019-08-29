`ifndef REG_SEQ__SV
`define REG_SEQ__SV

typedef class enviroment;
typedef class reg_case;
typedef class sequencer;
typedef class vsequencer;
class reg_sequence extends uvm_sequence#(transaction);

`uvm_object_utils(reg_sequence);
`uvm_declare_p_sequencer(vsequencer);

function new(string name="reg_sequence");
  super.new(name);
  endfunction

task pre_body();
  if(starting_phase!=null)
    starting_phase.raise_objection(this);
 `uvm_info(get_type_name(),"do pre_body()",UVM_LOW);
endtask

task body();
uvm_status_e status;
  // UVM_IS_OK
  // UVM_NOT_OK
uvm_reg_data_t value;

//uvm_component component_h;
//reg_case case_h;
//component_h = uvm_top.find("*.uvm_test_top");
//if(!$cast(case_h,component_h))
//  `uvm_fatal(get_type_name(),"cast error");
//case_h.rm.StartValue.read(status,value,UVM_FRONTDOOR);
//uvm_top.uvm_test_top.env.rm.startvalue.read(status,value,UVM_FRONTDOOR);

//READ StartValue
p_sequencer.rm.StartValue.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read reg error");
`uvm_info(get_type_name(),$sformatf("READ StartValue is %x",value),UVM_LOW);

#10;
//READ StartValue
p_sequencer.rm.StartValue.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read reg error");
`uvm_info(get_type_name(),$sformatf("READ StartValue is %x",value),UVM_LOW);

//WRITE StartValue
p_sequencer.rm.StartValue.write(status,32,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write reg error");
`uvm_info(get_type_name(),$sformatf("WRITE StartValue "),UVM_LOW);

//READ StartValue
p_sequencer.rm.StartValue.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read reg error");
`uvm_info(get_type_name(),$sformatf("READ StartValue is %x",value),UVM_LOW);

endtask

task post_body();
  if(starting_phase!=null)
    starting_phase.drop_objection(this);
 `uvm_info(get_type_name(),"do post_body()",UVM_LOW);
endtask


endclass

`endif
