`ifndef COMMAND_MONITOR__SV
`define COMMAND_MONITOR__SV

class command_monitor extends uvm_monitor;


`uvm_component_utils(command_monitor);

virtual alu_bfm bfm;

uvm_analysis_port#(transaction) ap;

function new(string name="command_monitor",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  ap=new("ap",this);
  if(!uvm_config_db#(virtual alu_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("command_monitor","Faild to get bfm!!!");
endfunction

function void connect_phase(uvm_phase phase);
  bfm.command_monitor_h=this;
endfunction

task run_phase(uvm_phase phase);
  
endtask

task collect_one_pkg(byte A,byte B,operation_t op);
  transaction tr;
  tr=new("tr");
  tr.A=A;
  tr.B=B;
  tr.op=op;
  ap.write(tr);
endtask

function operation_t op2enum(bit[2:0] op);
  case(op)
  3'b000: return no_op;
  3'b001: return add_op;
  3'b010: return and_op;
  3'b011: return xor_op;
  3'b100: return mul_op;
  default:  $fatal("Illegal operation : %d",op);
  endcase
endfunction

endclass


`endif



