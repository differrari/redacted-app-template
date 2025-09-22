ARCH       ?= aarch64-none-elf
CC         := $(ARCH)-gcc
CXX        := $(ARCH)-g++
LD         := $(ARCH)-ld

# Path to the [REDACTED] OS folder
OS_PATH ?= ../os

# Executable name
EXEC_NAME ?= proj.elf

# Path to the system's libshared. Static link only for now
STDINC ?= $(OS_PATH)/shared/
STDLIB ?= $(OS_PATH)/shared/libshared.a
CFLAGS ?= -ffreestanding -nostdlib -std=c99 -I$(STDINC) -O0
FS_PATH ?= $(OS_PATH)/fs/redos/user/$(EXEC_NAME)
C_SOURCE ?= $(shell find . -name '*.c')
OBJ ?= $(C_SOURCE:%.c=%.o)

.PHONY: dump

%.o : %.c
	$(CC) $(CFLAGS) -c -c $< -o $@

$(EXEC_NAME): $(OBJ)
	$(LD) -T linker.ld -o $(EXEC_NAME) $(OBJ) $(STDLIB)

all: $(EXEC_NAME)

run: all
	cp $(EXEC_NAME) $(FS_PATH)
	(cd $(OS_PATH); ./createfs; ./run_virt)

clean: 	
	rm $(OBJ)
	rm $(EXEC_NAME)

dump: all
	$(ARCH)-objdump -D $(EXEC_NAME) > dump
