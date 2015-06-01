# sources here
#
# SRC_VERILOG_$(d) += $(d)/rtl/test.v 
# SRC_VERILOG_$(d) += $(CORES_DIR)/core/rtl/test.v 

SRC_VHDL_$(d) += $(d)/rtl/system.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/rom/rtl/rom.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/ram/rtl/ram.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/reg/rtl/reg.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/alu/rtl/alu.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/PC/rtl/PC.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/aleaManager/rtl/aleaManager.vhd
SRC_VHDL_$(d) += $(CORES_DIR)/pipeline/rtl/pipeline.vhd
