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
set_global_assignment -name FAMILY "Cyclone IV"
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
#my_pin_assignment   FPGA_CLK2_50     PIN_R8     "3.3-V LVTTL"
#my_pin_assignment   FPGA_CLK3_50     PIN_R8     "3.3-V LVTTL"

my_pin_assignment   FPGA_CLK1_50     PIN_R8	"3.3-V LVTTL"
#my_pin_assignment   FPGA_CLK2_50     PIN_R8	"3.3-V LVTTL"
##my_pin_assignment   FPGA_CLK3_50     PIN_R8	"3.3-V LVTTL"

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

#my_pin_assignment   GPIO_0[0]	     PIN_D3	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[1]	     PIN_C3	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[2]	     PIN_A2	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[3]	     PIN_A3	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[4]	     PIN_B3	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[5]	     PIN_B4	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[6]	     PIN_A4	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[7]	     PIN_B5	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[8]	     PIN_A5	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[9]	     PIN_D5	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[10]	     PIN_B6	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[11]	     PIN_A6	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[12]	     PIN_B7	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[13]	     PIN_D6	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[14]	     PIN_A7	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[15]	     PIN_C6	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[16]	     PIN_C8	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[17]	     PIN_E6	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[18]	     PIN_E7	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[19]	     PIN_D8	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[20]	     PIN_E8	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[21]	     PIN_F8	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[22]	     PIN_F9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[23]	     PIN_E9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[24]	     PIN_C9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[25]	     PIN_D9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[26]	     PIN_E11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[27]	     PIN_E10	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[28]	     PIN_C11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[29]	     PIN_B11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[30]	     PIN_A12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[31]	     PIN_D11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[32]	     PIN_D12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[33]	     PIN_B12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[34]	     PIN_A8	"3.3-V LVTTL"
#my_pin_assignment   GPIO_0[35]	     PIN_B8	"3.3-V LVTTL"

#my_pin_assignment   GPIO_1[0]	     PIN_F13	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[1]	     PIN_T15	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[2]	     PIN_T14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[3]	     PIN_T13	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[4]	     PIN_R13	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[5]	     PIN_T12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[6]	     PIN_R12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[7]	     PIN_T11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[8]	     PIN_T10	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[9]	     PIN_R11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[10]	     PIN_P11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[11]	     PIN_R10	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[12]	     PIN_N12	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[13]	     PIN_P9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[14]	     PIN_N9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[15]	     PIN_N11	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[16]	     PIN_L16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[17]	     PIN_K16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[18]	     PIN_R16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[19]	     PIN_L15	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[20]	     PIN_P15	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[21]	     PIN_P16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[22]	     PIN_R14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[23]	     PIN_N16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[24]	     PIN_N15	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[25]	     PIN_P14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[26]	     PIN_L14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[27]	     PIN_N14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[28]	     PIN_M10	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[29]	     PIN_L13	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[30]	     PIN_J16	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[31]	     PIN_K15	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[32]	     PIN_J13	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[33]	     PIN_J14	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[34]	     PIN_T9	"3.3-V LVTTL"
#my_pin_assignment   GPIO_1[35]	     PIN_R9	"3.3-V LVTTL"

#my_pin_assignment   ARDUINO_IO[0]    PIN_A14	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[1]    PIN_B16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[2]    PIN_C14	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[3]    PIN_C16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[4]    PIN_C15	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[5]    PIN_D16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[6]    PIN_D15	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[7]    PIN_D14	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[8]    PIN_F15	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[9]    PIN_F16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[10]   PIN_F14	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[11]   PIN_G16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[12]   PIN_G15	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[13]   PIN_E15	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[14]   PIN_E16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_IO[15]   PIN_M16	"3.3-V LVTTL"
#my_pin_assignment   ARDUINO_RESET_N  PIN_M16	"3.3-V LVTTL"

my_pin_assignment   ADC_CONVST	     PIN_A10	"3.3-V LVTTL"
my_pin_assignment   ADC_SCK	     PIN_B14	"3.3-V LVTTL"
my_pin_assignment   ADC_SDI	     PIN_B10	"3.3-V LVTTL"
my_pin_assignment   ADC_SDO	     PIN_A9	"3.3-V LVTTL"

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to ARDUINO_IO[14]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to ARDUINO_IO[15]

# Commit assignments
export_assignments


# Run synthesis
execute_flow -compile


# Close project
#project_close
