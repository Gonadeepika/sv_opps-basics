# Makefile for Class/Handle/Object - SV Lab03 

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = VCS

help:
	@echo ==============================================================================================================
	@echo " USAGE   	--  make target											"
	@echo " clean   	=>  clean the earlier log and intermediate files.						"
	@echo " run_sim   	=>  compile & run the simulation in batch mode with test_class_defn.sv file.			"
	@echo " run_sim1  	=>  compile & run the simulation in batch mode with test_obj_assignment.sv file.		"
	@echo " run_class  	=>  clean, compile & run the simulation in batch mode with test_class_defn.sv file.		"
	@echo " run_obj_ass 	=>  clean, compile & run the simulation in batch mode with test_obj_assignment.sv file.		"
	@echo ===============================================================================================================

clean : clean_$(SIMULATOR)
run_sim : run_sim_$(SIMULATOR)
run_class : run_class_$(SIMULATOR)
run_sim1 : run_sim1_$(SIMULATOR)
run_obj_ass : run_obj_ass_$(SIMULATOR)
	

# ---- Start of Definitions for Mentor's Questa Specific Targets -----#

run_class_Questa: clean_Questa run_sim_Questa

run_obj_ass_Questa: clean_Questa run_sim1_Questa

run_sim_Questa: 
	qverilog ../tb/test_class_defn.sv
	
run_sim1_Questa: 
	qverilog ../tb/test_obj_assignment.sv
	
clean_Questa:
	rm -rf transcript* *log* *.wlf modelsim.ini work dff
	clear
	
# ---- End of Definitions for Mentor's Questa Specific Targets -----#	

# ---- Start of Definitions for Synopsys VCS Specific Targets -----#

run_class_VCS: clean_VCS run_sim_VCS

run_obj_ass_VCS: clean_VCS run_sim1_VCS

run_sim_VCS: 
	vcs -l comp.log -sverilog ../tb/test_class_defn.sv
	./simv

run_sim1_VCS: 
	vcs -l comp.log -sverilog ../tb/test_obj_assignment.sv
	./simv
	
clean_VCS:
	rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h
	clear 
	
# ---- End of Definitions for Synopsys VCS Specific Targets -----#
