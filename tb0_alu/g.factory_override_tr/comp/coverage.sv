`ifndef COVERAGE__SV
`define COVERAGE__SV

class coverage extends uvm_subscriber#(transaction);
`uvm_component_utils(coverage);

byte unsigned A;
byte unsigned B;
bit[2:0] op;

function new(string name="coverage",uvm_component parent=null);
  super.new(name,parent);
  data=new();
  cmd=new();
endfunction

covergroup data;
all_op:coverpoint op{
      ignore_bins all_op={rst_op,no_op};
       }

a_cov:coverpoint A{
  bins zeros = {'h00};
  bins ones = {'hff};
  bins others={['h01:'hfe]};
}

b_cov:coverpoint B{
  bins zeros = {'h00};
  bins ones = {'hff};
  bins others={['h01:'hfe]};
}

a_b_op: cross a_cov,b_cov,all_op{
          bins add_00= binsof(all_op) intersect {add_op} &&
            (binsof(a_cov.zeros) || binsof(b_cov.zeros));
          bins add_FF= binsof(all_op) intersect {add_op} &&
            (binsof(a_cov.ones) || binsof(b_cov.ones));
         bins and_00 = binsof(all_op) intersect {and_op} &&
         (binsof(a_cov.zeros) || binsof(b_cov.zeros));
         bins and_FF = binsof(all_op) intersect {and_op} &&
         (binsof(a_cov.ones) || binsof(b_cov.ones));
         bins xor_00 = binsof(all_op) intersect {xor_op} &&
         (binsof(a_cov.zeros) || binsof(b_cov.zeros));
         bins xor_FF = binsof(all_op) intersect {xor_op} &&
         (binsof(a_cov.ones) || binsof(b_cov.ones));
         bins mul_00 = binsof(all_op) intersect {mul_op} &&
         (binsof(a_cov.zeros) || binsof(b_cov.zeros));
         bins mul_FF = binsof(all_op) intersect {mul_op} &&
         (binsof(a_cov.ones) || binsof(b_cov.ones)); 
         ignore_bins others_only=binsof(a_cov.others) && binsof(b_cov.others);
}
endgroup

covergroup cmd;
coverpoint(op){
  bins rst2op[]=(rst_op=>[add_op:mul_op]),(rst_op=>no_op);
  bins op2rst[]=([add_op:mul_op]=>rst_op),(no_op=>rst_op);
  bins op[]={[add_op:mul_op],no_op,rst_op};
  bins twoops[]=([no_op:mul_op][*2]);
        }
endgroup


function void  write(transaction t);
  A=t.A;
  B=t.B;
  op=t.op;
  data.sample();
  cmd.sample();
endfunction


endclass

`endif
