################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: int_bitcount.elf

# Tool invocations
int_bitcount.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross GCC Linker'
	/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/bin/msp430-elf-gcc  -mhwmult=16bit -O2 -g -gdwarf-3 -gstrict-dwarf -Wall -g3 -msmall -fstrict-aliasing -Wstrict-aliasing -save-temps -fstack-usage -mcode-region=none -mdata-region=none -mmcu=msp430 -Wl,-Map,"int_bitcount.map" -Wl,--gc-sections -T/home/hiram/master/Qwark/altera_de0_nano/software/ldscripts/linker.msp430-elf.x -L/opt/ti/ccsv8/ccs_base/msp430/include_gcc -o "int_bitcount.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) int_bitcount.elf
	-@echo ' '

.PHONY: all clean dependents

-include ../makefile.targets
