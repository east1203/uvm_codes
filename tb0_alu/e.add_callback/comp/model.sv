`ifndef MODEL__SV
`define MODEL__SV

class model extends uvm_component;

`uvm_component_utils(model);

virtual alu_bfm bfm;

uvm_blocking_get_port#(transaction) port;
uvm_analysis_port#(result_transaction) ap;

function new(string name="modle",uvm_component parent = null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  port = new("port",this);
  ap = new("ap",this);
  if(!uvm_config_db#(virtual alu_bfm)::get(this,"","bfm",bfm))
    `uvm_fatal("model","Faile get bfm!!!");
endfunction

task run_phase(uvm_phase phase);
  transaction model_get_tr;
  result_transaction model_result_tr;
  while(1) begin
    port.get(model_get_tr);
    `uvm_info("model","model get transaction!!!",UVM_LOW);
    `ifdef MODEL_PRINT
      `uvm_info("model","print model_get_tr",UVM_LOW);
      model_get_tr.print();
    `endif
    model_result_tr = new("model_result_tr");
    @(posedge bfm.done);
    case(model_get_tr.op)
      add_op:model_result_tr.result=model_get_tr.A+model_get_tr.B;
      and_op:model_result_tr.result=model_get_tr.A&model_get_tr.B;
      xor_op:model_result_tr.result=model_get_tr.A^model_get_tr.B;
      mul_op:model_result_tr.result=model_get_tr.A*model_get_tr.B;
    endcase
    ap.write(model_result_tr);
    `ifdef MODEL_PRINT
      `uvm_info("model","print model_result_tr",UVM_LOW);
      model_result_tr.print();
    `endif
    
 end 
endtask

endclass


`endif
