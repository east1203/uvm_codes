`ifndef BFM__SV
`define FFM__SV

interface bfm;

logic clk;
logic reset_n;

initial begin
  clk=0;
  forever #10 clk = ~clk;
end

task reset;
  reset_n=0;
  @(posedge clk);
  @(posedge clk);
  reset_n=1;
endtask


endinterface

`endif
