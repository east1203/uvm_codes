`ifndef REG_MODEL__SV
`define REG_MODEL__SV
// StartValue 0x00
// feeddog    0x08
// mode       0x10
//name       addr   width     field  RW   RESET
//StartValue 0x00   32bit     32     R/W  0XFF
//reddog     0x08   32bit      1bit     W0   0x0
//mode       0x10   32bit      2bit     (bit1) R/W  X01
//                                      (bit0) RW)  0x0
                             
class reg_StartValue extends uvm_reg;

  `uvm_object_utils(reg_StartValue);

  rand uvm_reg_field startvalue;

  function new(string name="reg_StartValu");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build();
    startvalue=uvm_reg_field::type_id::create("startvalue",null,get_full_name());
    startvalue.configure(this,32,0,"RW",1,'hff,1,1,0);
  endfunction

endclass

class reg_model extends uvm_reg_block;

`uvm_object_utils(reg_model);

  rand reg_StartValue StartValue;

  function new(string name="reg_model");
    super.new(.name(name),.has_coverage(UVM_NO_COVERAGE));
  endfunction

  function void build();
    default_map = create_map("default_map",0,4,UVM_BIG_ENDIAN,0);
    StartValue = reg_StartValue::type_id::create("StartValue",null,get_full_name());
    StartValue.configure(this,null,"");
    StartValue.build();
    default_map.add_reg(StartValue,'h00,"RW");
  endfunction

endclass

class adapter extends uvm_reg_adapter;
  `uvm_object_utils(adapter);

  function new(string name="adapter");
    super.new(name);
  endfunction

  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    transaction tr;
    tr=new("new");
    tr.pwrite=(rw.kind==UVM_WRITE)?WRITE:READ; 
    tr.paddr=rw.addr;
    tr.pwdata=rw.data;
    return tr;
  endfunction

  function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
    transaction tr;
    if(!$cast(tr,bus_item))
      `uvm_fatal(get_type_name(),"Faild cast");
    rw.addr=tr.paddr;
    rw.kind=(tr.pwrite==READ)?UVM_READ:UVM_WRITE;
    rw.data=tr.prdata;
    //if(tr.pwrite==READ)
    //  rw.data=tr.prdata;
    //else
    //  rw.data=tr.pwdata;
    rw.status=UVM_IS_OK;
  endfunction  

endclass

`endif
