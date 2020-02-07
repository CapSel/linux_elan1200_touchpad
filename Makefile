obj-m = hid-elan.o
KVERSION ?= $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
install:
	cp ./hid-elan.ko /lib/modules/$(KVERSION)/kernel/drivers/hid/
	depmod -a $(KVERSION)
