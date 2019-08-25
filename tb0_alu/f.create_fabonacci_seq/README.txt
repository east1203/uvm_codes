
time : 2019-08-22

***** files category ******
[case]
  base_test.sv
  cases.sv
  fab_case.sv ------ (new)
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
  seq_fabonacci.sv ----- (new)

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


(new) Control alu to create FABONACCI sequence !!!
(new) ALU operate add_op.
(new) Result:
33:@ 90000 fabonacci sequence is     2
39:@ 130000 fabonacci sequence is     3
45:@ 170000 fabonacci sequence is     5
51:@ 210000 fabonacci sequence is     8
57:@ 250000 fabonacci sequence is    13
63:@ 290000 fabonacci sequence is    21
69:@ 330000 fabonacci sequence is    34
75:@ 370000 fabonacci sequence is    55
81:@ 410000 fabonacci sequence is    89
87:@ 450000 fabonacci sequence is   144
93:@ 490000 fabonacci sequence is   233
143:@ 530000 fabonacci sequence is   377
  
        
Add coverage,coverage class extends from uvm_subscriper.        
Add scoreboard ,And connect scb with model and result_monitor.
The scoreboard compares success!
