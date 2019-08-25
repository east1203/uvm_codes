`ifndef MODEL__SV
`define MODEL__SV

class model extends uvm_component;
`uvm_component_utils(model);

uvm_analysis_port#(result_transaction) ap;
uvm_blocking_get_port#(transaction) port;
virtual alu_bfm bfm;
function new(string name="model",uvm_component parent=null);
  super.new(name,parent);
  ap=new("ap",this);
  port=new("port",this);
endfunction
function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual alu_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("model","Failed to get bfm");
endfunction
task run_phase(uvm_phase phase);
  transaction cmd_tr;
  result_transaction rlt_tr;
  while(1) begin
    rlt_tr=new();
    port.get(cmd_tr);
    `uvm_info("model","model get one cmd_tr",UVM_LOW);
    cmd_tr.print();
    @(posedge bfm.done);
    case(cmd_tr.op)
      and_op: rlt_tr.result=cmd_tr.A&cmd_tr.B;
      add_op: rlt_tr.result=cmd_tr.A+cmd_tr.B;
      xor_op: rlt_tr.result=cmd_tr.A^cmd_tr.B;
      mul_op: rlt_tr.result=cmd_tr.B*cmd_tr.B;
    //  default:
    //    `uvm_fatal("model","Unexpected op");
    endcase

    ap.write(rlt_tr);
    `uvm_info("model","model create one rlt_tr",UVM_LOW);
    rlt_tr.print();
  end
endtask

endclass


`endif
