
time : 2019-08-28

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
  scoreboard.sv  --------------- (modified)
  model.sv    ------------- (modified)
  coverage.sv
[obj]
  transaction.sv ----------- (modified)
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
        ->scb
        ->cov

(new) Modified model and scoreboard ,fixed previous error,
    the tb can deal with no_op and rst_op now!!!

Add coverage,coverage class extends from uvm_subscriper.        
Add scoreboard ,And connect scb with model and result_monitor.
The scoreboard compares success!
