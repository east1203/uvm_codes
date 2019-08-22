
time : 2019-08-21

***** files category ******
[case]
  base_test.sv
  cases.sv
[comp]
  sequencer.sv
  driver.sv
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
        ->sqr
        ->drv

Using config_db to set  the phase's default_sequence of sqr. (build_phase)       
Objection raise and drop in sequence;
