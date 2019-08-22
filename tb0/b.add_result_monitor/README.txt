
time : 2019-08-22

***** files category ******
[case]
  base_test.sv
  cases.sv
[comp]
  sequencer.sv
  driver.sv
  agent.sv
  env.sv
  command_monitor.sv
  result_monitor.sv
  model.sv
[obj]
  transaction.sv
  result_transaction.sv
[seq]
  sequence0.sv

filelist
Makefile
tb_pkg.sv
alu_bfm.sv
top.sv

***** description *****
Basic uvm testbench:
top
  bfm()
  dut
  case0 ->seq0
    -> base_test
      ->env0 
        ->i_agt
          ->c_mon
          ->sqr
          ->drv
        ->o_agt
          ->r_mon
        ->mdl



Add result_monitor;
Reset operation In driver's run_phase according bfm.reset_alu() task;
