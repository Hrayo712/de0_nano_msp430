################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c \
../qwark.c \
../timerA.c \
../uart.c 

OBJS += \
./main.o \
./qwark.o \
./timerA.o \
./uart.o 

C_DEPS += \
./main.d \
./qwark.d \
./timerA.d \
./uart.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/bin/msp430-elf-gcc -D PFX_MSP430_ELF  -c  -mmcu=msp430 -mhwmult=16bit -std=c99 -I/home/hiram/master/Qwark/altera_de0_nano/software/libs -I/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include -I/opt/ti/ccsv8/ccs_base/msp430/include_gcc -O2 -g3 -Wall -g -gdwarf-3 -gstrict-dwarf -Wall -g3 -msmall -fstrict-aliasing -Wstrict-aliasing -save-temps -fstack-usage -mcode-region=none -mdata-region=none -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


