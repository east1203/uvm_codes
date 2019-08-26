
case="default_case"

run: vcs sim


vcs:
	vcs -sverilog +acc +vpi \
		+incdir+${UVM_HOME}/src	\
		${UVM_HOME}/src/uvm_pkg.sv	\
		${UVM_HOME}/src/dpi/uvm_dpi.cc	\
		-CFLAGS -DVCS	\
		-timescale=1ns/1ps	\
		-debug_all	\
		-f filelist	\
		-l run.log


sim:
	./simv +UVM_TESTNAME=${case} -l sim.log

dve:
	dve -vpd *.vpd&

urg:
	urg -dir simv.vdb -report both

.PHONY:clean
clean:
	rm -rf simv 
	rm -rf csrc simv.daidir
	rm -rf vc_hdrs.h
	rm -rf ucli.key
	rm -rf DVEfiles vcdplus.vpd
	rm -rf simv.vdb
	rm -rf *.log
	rm -rf both
	rm error.log info.log fatal.log warning.log



