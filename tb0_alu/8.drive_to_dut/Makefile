

run: vcs sim


vcs:
	vcs -sverilog +acc +vpi \
		+incdir+${UVM_HOME}/src	\
		${UVM_HOME}/src/uvm_pkg.sv	\
		${UVM_HOME}/src/dpi/uvm_dpi.cc	\
		-CFLAGS -DVCS	\
		-timescale=1ns/1ps	\
		-debug_all	\
		-f filelist


sim:
	./simv +UVM_TESTNAME=case0


.PHONY:clean
clean:
	rm -rf simv 
	rm -rf csrc simv.daidir
	rm -rf vc_hdrs.h
	rm -rf ucli.key
	rm -rf DVEfiles *.vpd
	rm -rf error.log info.log fatal.log warning.log



