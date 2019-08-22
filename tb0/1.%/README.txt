
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
  (empty)

filelist
Makefile
tb_pkg.sv
top.sv

***** description *****
Basic uvm testbench:
  case0
    -> base_test
      ->env0
        ->sqr
        ->drv

sqr using "uvm_blocking_put_port" sends trasaction to drv's "uvm_blocking_put_export" .       


