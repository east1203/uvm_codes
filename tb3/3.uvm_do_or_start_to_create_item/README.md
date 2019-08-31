
## time:2019-08-31

## file category:
[case0]
  base\_case.sv
  start\_case.sv
  uvm\_do\_case.sv
[seq]
  sequence\_start.sv
  sequence\_uvm\_do.sv
[comp]
  driver.sv
  enviroment.sv
  sequencer.sv
[obj]
  transaction.sv

## uvm tree
uvm\_top
  > uvm\_test\_top --- start\_case or uvm\_do\_case
    > env
      sqr
      driver

## description:

  Using uvm\_do or start to create sequence item. Equal result.      



