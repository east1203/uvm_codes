`ifndef SCOREBOARD__SV
`define SCOREBOARD__SV

class scoreboard extends uvm_scoreboard;

`uvm_component_utils(scoreboard);

result_transaction exp_queue[$];

uvm_blocking_get_port#(result_transaction) rly_port;
uvm_blocking_get_port#(result_transaction) exp_port;


function new(string name="scb",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  rly_port=new("rly_port",this);
  exp_port=new("exp_port",this);
endfunction

task run_phase(uvm_phase phase);
  result_transaction rly_tr;
  result_transaction exp_tr;
  result_transaction tmp_tr;
  bit result;
  super.run_phase(phase);
  fork
    while(1) begin
      exp_port.get(exp_tr);
      exp_queue.push_back(exp_tr);
      `ifdef SCB_PRINT
        exp_tr.print();
      `endif
    end
    while(1) begin
      rly_port.get(rly_tr);
      `ifdef SCB_PRINT
        rly_tr.print();
      `endif
      if(exp_queue.size()>0) begin
        tmp_tr=exp_queue.pop_front();
        result=rly_tr.compare(tmp_tr);
        if(result)
          `uvm_info("scoreboard","Compare SUCCESSLY!!!",UVM_LOW);
      //  else begin
      //    `uvm_error("scoreboard","Compared FAILED!!!");
      //    tmp_tr.print();
      //    rly_tr.print();
      //  end
      end 
      else begin
        `uvm_error("scoreboard","Get from DUT,while can not get from model");
      `ifdef SCB_PRINT
        rly_tr.print();
      `endif
      end
    end

  join
  
endtask

endclass

`endif
