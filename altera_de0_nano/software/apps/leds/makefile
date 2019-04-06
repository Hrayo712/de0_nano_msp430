# makfile configuration
NAME            = leds
OBJECTS         = main.o 

# Compiler performance option (-Os / -O2 / -O3)
PORT_CFLAGS     = -O3

# Choose GCC toolchain prefix ('msp430' for MSPGCC / 'msp430-elf' for GCC RedHat/TI)
ifndef MSPGCC_PFX
MSPGCC_PFX      = msp430-elf
endif

# disable some warnings specific to the Dhrystone code
WARNINGS        =  -Wall

# Select flags depending on selected toolchain
ifeq ($(MSPGCC_PFX),msp430-elf)
INCDIR          = -I ../../libs -I/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include -I/opt/ti/ccsv8/ccs_base/msp430/include_gcc
CFLAGS		= -mcpu=msp430 -mhwmult=16bit -std=c99 $(INCDIR) $(PORT_CFLAGS) -g3 ${WARNINGS} -gdwarf-3 -gstrict-dwarf -msmall -fstrict-aliasing -Wstrict-aliasing -save-temps -fstack-usage -mcode-region=none -mdata-region=none
LFLAGS 		= -gdwarf-3 -gstrict-dwarf -msmall -fstrict-aliasing -Wstrict-aliasing -save-temps -fstack-usage -mcode-region=none -mdata-region=none
else
CFLAGS		= -D PFX_MSP430               $(PORT_CFLAGS) ${WARNINGS} -g -mcpu=430    -mmpy=16	-mivcnt=16
endif

# Toolchain executables
CC              = ${MSPGCC_PFX}-gcc
OBJCOPY		= ${MSPGCC_PFX}-objcopy
OBJDUMP         = ${MSPGCC_PFX}-objdump
OBJSIZE         = ${MSPGCC_PFX}-size

.PHONY: all FORCE clean download dist

#all should be the first target. it's built when make is runwithout args
all: ${NAME}.elf ${NAME}.a43 ${NAME}.lst ${NAME}.size

#confgigure the next line if you want to use the serial download
download: download-uart

#additional rules for files
${NAME}.elf: ${OBJECTS}
	${CC} -T ../../ldscripts/linker.${MSPGCC_PFX}.x -mcpu=msp430 -mhwmult=16bit -L/opt/ti/ccsv8/ccs_base/msp430/include_gcc -Wl,-Map=./${NAME}.map ${LFLAGS} -o $@ ${OBJECTS}

${NAME}.a43: ${NAME}.elf
	${OBJCOPY} -O ihex $^ $@

${NAME}.lst: ${NAME}.elf
	${OBJDUMP} -dSt $^ >$@

${NAME}.size: ${NAME}.elf
	${OBJSIZE}  $^ >$@

download-uart: all
	openmsp430-loader.tcl -device /dev/ttyUSB0 -baudrate 115200 ${NAME}.elf

clean:
	rm -f ${NAME} ${NAME}.a43 ${NAME}.lst ${NAME}.elf $(NAME).size *.o

#backup archive
dist:
	tar czf dist.tgz *.c *.h *.txt makefile

#dummy target as dependecy if something has to be build everytime
FORCE:

#project dependencies
#main.o: main.c
#../../libs/tA/timerA.o: ../../libs/tA/timerA.c
