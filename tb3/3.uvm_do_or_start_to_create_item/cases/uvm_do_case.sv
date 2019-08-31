class uvm_do_case extends base_case;

`uvm_component_utils(uvm_do_case);

function new(string name="uvm_do_case",uvm_component parent=null);
  super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction

task run_phase(uvm_phase phase);
  sequence_uvm_do seq;
  seq=new("seq");
  seq.starting_phase=phase;
  seq.start(env.sqr);
endtask


endclass

