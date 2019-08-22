
time : 2019-08-22

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
        ->sqr
        ->drv

driver drives transaction to interface,in other words to dut.
