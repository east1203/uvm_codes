`ifndef BACKDOOR_SEQ__SV
`define BACKDOOR_SEQ__SV

class backdoor_seq extends sequence_base;

`uvm_object_utils(backdoor_seq);
`uvm_declare_p_sequencer(vsequencer);

function new(string name="backdoor_seq");
  super.new(name);
endfunction

task body();
  uvm_status_e status;
  //UVM_IS_OK
  //UVM_NOT_OK
  uvm_reg_data_t value;  
#10;     //need delay some time        
  p_sequencer.rm.Mode.peek(status,value);
  `uvm_info(get_type_name(),$sformatf("%s :BACKDOOR peek Mode is %0x",get_sequence_path(),value),UVM_LOW);
  p_sequencer.rm.StartValue.peek(status,value);
  `uvm_info(get_type_name(),$sformatf("%s : BACKDOOR peek StartValue is %0x",get_sequence_path(),value),UVM_LOW);
#100
  p_sequencer.rm.StartValue.poke(status,'hff);
  `uvm_info(get_type_name(),$sformatf("%s:BACKDOOR poke StartValue is 'hff",get_sequence_path()),UVM_LOW);
                              
  p_sequencer.rm.StartValue.peek(status,value);
  `uvm_info(get_type_name(),$sformatf("%s BACKDOOR peek StartValue is %0x",get_sequence_path(),value),UVM_LOW); 
                      
  p_sequencer.rm.StartValue.read(status,value,UVM_BACKDOOR);                
  `uvm_info(get_type_name(),$sformatf("BACKDOOR READ %s StartValue is %0x",get_sequence_path(),value),UVM_LOW);
                         

endtask



endclass

`endif
