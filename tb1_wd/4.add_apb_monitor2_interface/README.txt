
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
[seq]
  sequence0.sv
[cases]
  default_case.sv
  base_case.sv
  case0.sv

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
  ->dut
  ->bfm

(new) Collect input transaction IN interface.

 Add monitor_apb to agent.
 monitor_apb collect apb transaction


Add drive_one_pkg task

 Try to create a APB agent.
 Have not writen drive_one_pkg task
 Do not have input monitor

