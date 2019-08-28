
@op=qw/add and xor mul/;
@tg=qw/00 FF/;
print $op[2];
print $tg;
foreach $ele (@op) {
  print $ele;
}
open fp,">out";
for(my $I=0;$i<4;$i=$i+1) {
  print fp "bins $op[$i]_00 = binsof(all_op) intersect {$op[$i]_op} &&
  (binsof(a_cov.zeros) || binsof(b_cov.zeros))\n";
  print fp "bins $op[$i]_FF = binsof(all_op) intersect {$op[$i]_op} &&
  (binsof(a_cov.ones) || binsof(b_cov.ones))\n"

}
