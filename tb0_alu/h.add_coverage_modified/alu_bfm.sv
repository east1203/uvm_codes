`ifndef ALU_BFM__SV
`define ALU_BFM__SV

interface alu_bfm;
  import tb_pkg::*;
  
  byte A;
  byte B;
  logic clk;
  logic reset_n;
  logic [2:0] op;
  logic start;
  logic done;
  logic [15:0] result;

  initial begin
    clk=0;
    forever begin
      #10;
      clk =~clk;
    end
  end
  task reset_alu();
    reset_n = 1'b0;
    @(negedge clk);
    @(negedge clk);
    reset_n = 1'b1;
    start = 1'b0;
  endtask:reset_alu

  task drive_one_pkg(transaction tr);
    if(tr.op == rst_op) begin
      @(posedge clk);
      reset_n = 1'b0;
      start = 1'b0;
      @(posedge clk);
#1;
      reset_n = 1'b1;
    end
    else begin
      @(negedge clk);
      op = tr.op;
      A = tr.A;
      B = tr.B;
      start = 1'b1;
      if(tr.op == no_op) begin
        @(posedge clk);
#1;
        start = 1'b0;
      end
      else begin
        do
          @(negedge clk);//this is negedge
        while(done==0);
        tr.result = result;
        start = 1'b0;
      end
    end
  endtask
function operation_t op2enum();
  case(op)
  3'b000: return no_op;
  3'b001: return add_op;
  3'b010: return and_op;
  3'b011: return xor_op;
  3'b100: return mul_op;
  default:  $fatal("Illegal operation : %d",op);
  endcase
endfunction

  command_monitor command_monitor_h;

  always@(posedge clk ) begin
    static bit new_command=0;
    if(!start) begin
      new_command = 1'b1;
    end
    else if(start) begin
      if(new_command) begin
        $display("[collect ****]");
        $display("op is %d",op);
        command_monitor_h.collect_one_pkg(A,B,op2enum());
        new_command = (op2enum()==no_op); 
      end
    end
  end

  always@(negedge reset_n) begin
      command_monitor_h.collect_one_pkg(A,B,rst_op);
  end


  result_monitor  result_monitor_h;

  always@(posedge clk) begin
    if(done)
      result_monitor_h.collect_one_pkg(result);
  end

endinterface

`endif
