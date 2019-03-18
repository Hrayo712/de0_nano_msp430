# Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions
# and other software and tools, and its AMPP partner logic
# functions, and any output files from any of the foregoing
# (including device programming or simulation files), and any
# associated documentation or information are expressly subject
# to the terms and conditions of the Altera Program License
# Subscription Agreement, the Altera Quartus II License Agreement,
# the Altera MegaCore Function License Agreement, or other
# applicable license agreement, including, without limitation,
# that your use is for the sole purpose of programming logic
# devices manufactured by Altera and sold by Altera or its
# authorized distributors.  Please refer to the applicable
# agreement for further details.

# Load Quartus II Tcl Project package
package require ::quartus::project
package require ::quartus::flow

# Create project
project_new -revision openMSP430_fpga openMSP430_fpga

# Make assignments
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE22F17C6

set_global_assignment -name VERILOG_FILE             ../scripts/design_rtl.v
set_global_assignment -name SEARCH_PATH              ../../../rtl/verilog/openmsp430/
set_global_assignment -name SEARCH_PATH              ../../../rtl/verilog/openmsp430/periph/
set_global_assignment -name SEARCH_PATH              ../../../rtl/verilog/opengfx430/
set_global_assignment -name TOP_LEVEL_ENTITY         openMSP430_fpga
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

# PERFORMANCE / AREA / BALANCED
set_global_assignment -name OPTIMIZATION_MODE            BALANCED
#set_global_assignment -name OPTIMIZATION_MODE           "HIGH PERFORMANCE EFFORT"
#set_global_assignment -name OPTIMIZATION_MODE           "AGGRESSIVE PERFORMANCE"
set_global_assignment -name OPTIMIZATION_TECHNIQUE       SPEED                        ;# AREA - BALANCED - SPEED

set_global_assignment -name ALLOW_REGISTER_MERGING       ON
set_global_assignment -name ALLOW_REGISTER_DUPLICATION   ON
set_global_assignment -name ALLOW_REGISTER_RETIMING      ON

set_global_assignment -name REMOVE_REDUNDANT_LOGIC_CELLS OFF
set_global_assignment -name REMOVE_DUPLICATE_REGISTERS   ON

set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

# Clock
set_global_assignment -name SDC_FILE ../scripts/design.sdc
#set_global_assignment -name FMAX_REQUIREMENT "50 MHz" -section_id myclock
#set_instance_assignment -name CLOCK_SETTINGS myclock -to FPGA_CLK1_50

# Pin assignments
proc my_pin_assignment {PORT_NAME PIN_NAME IO_STD} {
    set_location_assignment $PIN_NAME                 -to $PORT_NAME
    set_instance_assignment -name IO_STANDARD $IO_STD -to $PORT_NAME
}
my_pin_assignment   FPGA_CLK1_50     PIN_R8     "3.3-V LVTTL"

my_pin_assignment   KEY[0]	     PIN_J15	"3.3-V LVTTL"
my_pin_assignment   KEY[1]	     PIN_E1	"3.3-V LVTTL"

my_pin_assignment   SW[0]	     PIN_M1	"3.3-V LVTTL"
my_pin_assignment   SW[1]	     PIN_T8	"3.3-V LVTTL"
my_pin_assignment   SW[2]	     PIN_B9	"3.3-V LVTTL"
my_pin_assignment   SW[3]	     PIN_M15	"3.3-V LVTTL"

my_pin_assignment   LED[0]	     PIN_A15	"3.3-V LVTTL"
my_pin_assignment   LED[1]	     PIN_A13	"3.3-V LVTTL"
my_pin_assignment   LED[2]	     PIN_B13	"3.3-V LVTTL"
my_pin_assignment   LED[3]	     PIN_A11	"3.3-V LVTTL"
my_pin_assignment   LED[4]	     PIN_D1	"3.3-V LVTTL"
my_pin_assignment   LED[5]	     PIN_F3	"3.3-V LVTTL"
my_pin_assignment   LED[6]	     PIN_B1	"3.3-V LVTTL"
my_pin_assignment   LED[7]	     PIN_L3	"3.3-V LVTTL"

my_pin_assignment   UART_TX	     PIN_B4	"3.3-V LVTTL"
my_pin_assignment   UART_RX	     PIN_B5	"3.3-V LVTTL"

#External RAM assignments

my_pin_assignment  SRAM_DQ[0]		PIN_A5	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[1]		PIN_D5	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[2]		PIN_B6	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[3]		PIN_A6	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[4]		PIN_B7	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[5]		PIN_D6	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[6]		PIN_A7	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[7]		PIN_C6	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[8]		PIN_C8	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[9]		PIN_E6	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[10]		PIN_E7	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[11]		PIN_D8	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[12]		PIN_E8	"3.3-V LVTTL"

my_pin_assignment  SRAM_DQ[13]		PIN_F8	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[14]		PIN_F9	"3.3-V LVTTL"
my_pin_assignment  SRAM_DQ[15]		PIN_E9	"3.3-V LVTTL"



my_pin_assignment  SRAM_ADDR[0]		PIN_T10	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[1]		PIN_R11	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[2]		PIN_P11	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[3]		PIN_R10	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[4]		PIN_N12	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[5]		PIN_P9	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[6]		PIN_N9	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[7]		PIN_N11	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[8]		PIN_L16	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[9]		PIN_K16	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[10]	PIN_R16	"3.3-V LVTTL"
my_pin_assignment  SRAM_ADDR[11]	PIN_L15	"3.3-V LVTTL"

my_pin_assignment  SRAM_CE_N		PIN_F13	"3.3-V LVTTL"
my_pin_assignment  SRAM_WE_N		PIN_T15	"3.3-V LVTTL"
my_pin_assignment  SRAM_OE_N		PIN_T13	"3.3-V LVTTL"
my_pin_assignment  SRAM_UB_N		PIN_T12	"3.3-V LVTTL"
my_pin_assignment  SRAM_LB_N		PIN_T11	"3.3-V LVTTL"

set_instance_assignment -name FAST_OUTPUT_REGISTER ON        -to SRAM_DQ
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SRAM_DQ
set_instance_assignment -name FAST_OUTPUT_REGISTER ON 	     -to SRAM_ADDR
set_instance_assignment -name FAST_OUTPUT_REGISTER ON 	     -to SRAM_CE_N
set_instance_assignment -name FAST_OUTPUT_REGISTER ON 	     -to SRAM_WE_N
set_instance_assignment -name FAST_OUTPUT_REGISTER ON        -to SRAM_OE_N
set_instance_assignment -name FAST_OUTPUT_REGISTER ON        -to SRAM_UB_N
set_instance_assignment -name FAST_OUTPUT_REGISTER ON        -to SRAM_LB_N


# Commit assignments
export_assignments


# Run synthesis
execute_flow -compile


# Close project
#project_close
