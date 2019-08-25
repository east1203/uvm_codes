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
  transaction tr;
  result_transaction rtr;
  while(1) begin
    `uvm_warning("model","before get transacrtion");
    port.get(tr);
    `uvm_info("model","model get transaction!!!",UVM_LOW);
    tr.print();
    rtr = new("rtr");
    @(posedge bfm.done);
    `uvm_warning("model","bfm.done");
    case(tr.op)
      add_op:rtr.result=tr.A+tr.B;
      and_op:rtr.result=tr.A&tr.B;
      xor_op:rtr.result=tr.A^tr.B;
      mul_op:rtr.result=tr.A*tr.B;
    endcase
    `uvm_warning("model","before write");
    ap.write(rtr);
    `uvm_warning("model","after write");
 end 
endtask

endclass


`endif
