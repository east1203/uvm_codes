
time : 2019-08-22

***** files category ******
[case]
  base_test.sv
  cases.sv
  cb_case.sv ----- (new)
[cb] ----- (new)
  driver_cb.sv ----- (new)
  user_cb.sv   ----- (new)
[comp]
  sequencer.sv
  driver.sv
  agent.sv
  env.sv
  command_monitor.sv
  result_monitor.sv
  scoreboard.sv
  model.sv
  coverage.sv
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
        ->scb
        ->cov
      ->callback -----(new)


(new) Add callback mechanism to callback test.
    ***** BE ATTENTION ******
(new) Sequence starts in build phase.
(new) Callback object is created in connect phase.Callback can not in the same phase with sequence.

Add coverage,coverage class extends from uvm_subscriper.        
Add scoreboard ,And connect scb with model and result_monitor.
The scoreboard compares success!
