`ifndef REG_SEQ__SV
`define REG_SEQ__SV

typedef class enviroment;
typedef class reg_case;
typedef class sequencer;
typedef class vsequencer;
class reg_sequence extends sequence_base;

`uvm_object_utils(reg_sequence);
`uvm_declare_p_sequencer(vsequencer);

function new(string name="reg_sequence");
  super.new(name);
  endfunction


task body();
uvm_status_e status;
  // UVM_IS_OK
  // UVM_NOT_OK
uvm_reg_data_t value;

/******* Read register after reset *********/
//READ StartValue
p_sequencer.rm.StartValue.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read StartValue error");
`uvm_info(get_type_name(),$sformatf("READ StartValue is %x",value),UVM_LOW);
// READ feeddog
p_sequencer.rm.feeddog.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read feeddog error");
`uvm_info(get_type_name(),$sformatf("READ feeddog is %x",value),UVM_LOW);
// Read Mode
p_sequencer.rm.Mode.read(status,value,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"read Mode error");
`uvm_info(get_type_name(),$sformatf("READ Mode is %x",value),UVM_LOW);

#100;

//WRITE StartValue 32
p_sequencer.rm.StartValue.write(status,32,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write reg error");
`uvm_info(get_type_name(),$sformatf("WRITE StartValue 32 "),UVM_LOW);
// Whether timeout
#1000;

//Feed dog
p_sequencer.rm.feeddog.write(status,1,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write feeddog register error");
`uvm_info(get_type_name(),$sformatf("WRITE Feeddog 1"),UVM_LOW);
#500
//Feed dog before time out
p_sequencer.rm.feeddog.write(status,1,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write feeddog register error");
`uvm_info(get_type_name(),$sformatf("WRITE Feeddog 1 "),UVM_LOW);

/************* Change operation mode ***************/
// Write Mode ----- close WD
p_sequencer.rm.Mode.write(status,'h0,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write Mode error");
`uvm_info(get_type_name(),$sformatf("Write Mode 0x0"),UVM_LOW);
#100;
// Write Mode ----- open WD ---- 'h3 mode
p_sequencer.rm.Mode.write(status,'h3,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write mode error");
`uvm_info(get_type_name(),$sformatf("Write mode 0x3"),UVM_LOW);
// timeout 
#1000

//Feed dog
p_sequencer.rm.feeddog.write(status,1,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write feeddog register error");
`uvm_info(get_type_name(),$sformatf("WRITE Feeddog 1 "),UVM_LOW);
#500
//Feed dog before time out
p_sequencer.rm.feeddog.write(status,1,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write feeddog register error");
`uvm_info(get_type_name(),$sformatf("WRITE Feeddog 1 "),UVM_LOW);

#2000
// Write Mode ----- close WD
p_sequencer.rm.Mode.write(status,'h0,UVM_FRONTDOOR);
if(status==UVM_NOT_OK)
  `uvm_fatal(get_type_name(),"write Mode error");
`uvm_info(get_type_name(),$sformatf("Write Mode 0x0"),UVM_LOW);

endtask

endclass

`endif
