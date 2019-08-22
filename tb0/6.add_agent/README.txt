
time : 2019-08-21

***** files category ******
[case]
  base_test.sv
  cases.sv
[comp]
  sequencer.sv
  driver.sv
  agent.sv
  env.sv
[obj]
  transaction.sv
[seq]
  sequence0.sv

filelist
Makefile
tb_pkg.sv
top.sv

***** description *****
Basic uvm testbench:
  case0 ->seq0
    -> base_test
      ->env0 
        ->agt
         ->sqr
         ->drv

sequence start on case's run_phase.
Objection raise and drop in sequence;
