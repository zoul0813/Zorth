
DICT=forth.fs
BINDIR=bin
BIN=zorth

ZOS_INCLUDE = $(ZOS_PATH)/kernel_headers/z88dk-z80asm/

ASMFLAGS=-b -m -s -I$(ZOS_INCLUDE)
# -s -l -m -g -b

AS=$(shell which z88dk-z80asm z88dk.z88dk-z80asm | head -1)

all:
	mkdir -p $(BINDIR)
	$(AS) -Iinclude -o$(BINDIR)/$(BIN) $(ASMFLAGS) src/zorth.asm
	cp $(DICT) $(BINDIR)/$(DICT)

run:
	$(ZEAL_NATIVE_BIN) -H prod -r $(ZEAL_NATIVE_ROM) #-t tf.img -e eeprom.img

clean:
	rm -r $(BINDIR)