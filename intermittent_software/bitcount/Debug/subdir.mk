################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c \
../timerA.c 

OBJS += \
./main.o \
./timerA.o 

C_DEPS += \
./main.d \
./timerA.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/bin/msp430-elf-gcc -D PFX_MSP430_ELF -v -c  -mcpu=msp430 -mhwmult=16bit -std=c99 -I/home/hiram/git/de0_nano_msp430/altera_de0_nano/software/libs -I/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include -I/opt/ti/ccsv8/ccs_base/msp430/include_gcc -O0 -g3 -Wall -gdwarf-3 -gstrict-dwarf -msmall -fstrict-aliasing -Wstrict-aliasing -save-temps -fstack-usage -mcode-region=none -mdata-region=none -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


