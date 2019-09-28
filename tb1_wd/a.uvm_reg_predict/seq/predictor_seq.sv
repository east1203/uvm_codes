`ifndef PREDICTOR_SEQ__SV
`define PREDICTOR_SEQ__SV

typedef class vsequencer;
class predictor_seq extends sequence_base;

`uvm_object_utils(predictor_seq);
`uvm_declare_p_sequencer(vsequencer);

function  new(string name="predictor_seq");
  super.new(name);
endfunction 

task body;

  uvm_status_e status;
  uvm_reg_data_t value;


#10;
  // READ
  `uvm_info(get_type_name(),"TEST uvm_reg_predictor",UVM_MEDIUM);
  p_sequencer.rm.StartValue.read(status,value);
  if(status == UVM_IS_OK) begin
    `uvm_info(get_type_name(),$sformatf("READ StartValue is %0x",value),UVM_MEDIUM);
    end
  else begin
    `uvm_fatal(get_type_name(),"READ StartValue ERROR");
    end
    // GET_MIRRORED_VALUE
  value=p_sequencer.rm.StartValue.get_mirrored_value();
  `uvm_info(get_type_name(),$sformatf("MIRROR StartValue is %0x",value),UVM_MEDIUM);
  // GET DESIRED VALUE
  value=p_sequencer.rm.StartValue.get();
  `uvm_info(get_type_name(),$sformatf("GET desired value is %0x",value),UVM_MEDIUM);

#10;
  //WRITE
  p_sequencer.rm.StartValue.write(status,'hff);
  `uvm_info(get_type_name(),"WRITE StartValue",UVM_MEDIUM);
  if(status == UVM_NOT_OK) begin
    `uvm_fatal(get_type_name(),"WRITE StartValue ERROR");
    end
 // p_sequencer.rm.StartValue.predict('hff);
#10;
    // GET DESIRED VALUE
  value=p_sequencer.rm.StartValue.get();
  `uvm_info(get_type_name(),$sformatf("GET desired value is %0x",value),UVM_MEDIUM);
    // GET_MIRRORED_VALUE
  value=p_sequencer.rm.StartValue.get_mirrored_value();
  `uvm_info(get_type_name(),$sformatf("MIRROR StartValue is %0x",value),UVM_MEDIUM);
  p_sequencer.rm.StartValue.update(status);

#10;
  // READ
  p_sequencer.rm.StartValue.read(status,value);
  if(status==UVM_IS_OK) begin
    `uvm_info(get_type_name(),$sformatf("READ StartValue is %0x",value),UVM_MEDIUM);
  end
  else begin
    `uvm_fatal(get_type_name(),"READ StartValue ERROR");
  end
    // GET_MIRRORED_VALUE
  value=p_sequencer.rm.StartValue.get_mirrored_value();
  `uvm_info(get_type_name(),$sformatf("MIRROR StartValue is %0x",value),UVM_MEDIUM);
#10;
  // MIRROR
  `uvm_info(get_type_name(),"MIRROR StartValue",UVM_MEDIUM);
  p_sequencer.rm.StartValue.mirror(status,UVM_CHECK);
    // GET_MIRRORED_VALUE
  value=p_sequencer.rm.StartValue.get_mirrored_value();
  `uvm_info(get_type_name(),$sformatf("MIRROR StartValue is %0x",value),UVM_MEDIUM);
 
endtask

endclass


`endif
