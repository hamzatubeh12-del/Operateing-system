GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS =--32
LDPARAMS = -melf_i386

objects = loader.o gdt.o kernel.o port.o


%.o: %.cpp
		g++ $(GPPPARAMS) -o $@ -c $< 

%.o: %.s
		as $(ASPARAMS) -o $@ $<

myKernel.bin: linker.Id $(objects)
		ld $(LDPARAMS) -T $< -o $@ $(objects)


run: myKernel.bin
		qemu-system-i386 -kernel myKernel.bin


.phony: clean 
clean:
		rm -f $(objects) myKernel.bin myKernel.iso