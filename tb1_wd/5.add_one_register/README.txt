
2019-08-25


******** file cotegory ********
[watchdog]
  wd_top.v
  wd_apb.v
  watch.v
  wd_define.v
  filelist.f
[obj] 
  transaction.sv
[comp]
  driver.sv
  sequencer.sv
  monitor_apb.sv
  agent.sv
  enviroment.sv
  reg_model.sv  ----- (new)
  vsequencer.sv ------ (new)
[seq]
  sequence0.sv
  vsequence.sv ------ (new)
  reg_sequence.sv -----(new)
[cases]
  default_case.sv
  base_case.sv
  case0.sv
  reg_case.sv ------- (new)

top.sv
wd_bfm.sv
tb_pkg.sv
filelist
Makefile
README.txt

******* tb structure ********
top
  ->case0
    ->env
      ->i_agt
        ->drv
        ->sqr
        ->mon_apb
    ->rm   ------- (new)
    ->adapter ----- (new)
    ->vsqr  ----- (new)
  ->dut
  ->bfm
==========================================
==========================================
(new)  2019-08-29
  Add register model to tb.
  In reg_sequence I read and write "StartValue" register which has 'h00 address.
  Reg_sequence starts by uvm_config_db machanism IN build_phase of base_test. 

  I will add other register in the register model.
  
      
==========================================
==========================================

(new) Collect input transaction IN interface.

==========================================
==========================================

 Add monitor_apb to agent.
 monitor_apb collect apb transaction

==========================================
==========================================

Add drive_one_pkg task

==========================================
==========================================

 Try to create a APB agent.
 Have not writen drive_one_pkg task
 Do not have input monitor

