
time : 2019-08-22

***** files category ******
[case]
  base_test.sv
  cases.sv   ------- (modified)
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
  new_transaction.sv ------- (new)
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

(new) Using factory.set_type_override_by_type overrides transaction.

Add coverage,coverage class extends from uvm_subscriper.        
Add scoreboard ,And connect scb with model and result_monitor.
The scoreboard compares success!
