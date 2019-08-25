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

task run_phase(uvm_phase phase);
  transaction tr;
  tr=new("tr");
  collect_one_pkg(tr);  
  ap.write(tr);
endtask

task collect_one_pkg(ref transaction tr);
  static bit new_command;
  if(!bfm.start)
    new_command = 1'b1;
  else 
    if(new_command == 1'b1) begin
      tr.A = bfm.A;
      tr.B = bfm.B;
      tr.op = op2enum(bfm.op);
      new_command = (bfm.op == no_op);
    end
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



