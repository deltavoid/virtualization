

INSTALL_IMAGE := /home/zqy/Software/ubuntu-16.04.5-desktop-amd64.iso
IMAGE_PATH := ubuntu.qcow2
IMAGE_SIZE := 10G

CPUS := 4
MEMS = 4G

.PHONY: image install run

default: run

image:
	qemu-img create -f qcow2 $(IMAGE_PATH) $(IMAGE_SIZE)

install:
	sudo qemu-system-x86_64 \
        -machine ubuntu,accel=kvm \
        -smp $(CPUS) \
        -m $(MEMS) \
        -hda $(IMAGE_PATH) \
        -cdrom $(INSTALL_IMAGE) \
        -boot d

run:
	sudo qemu-system-x86_64 \
        -machine ubuntu,accel=kvm \
        -smp $(CPUS) \
        -m $(MEMS) \
        -hda $(IMAGE_PATH) 

nographic:
	sudo qemu-system-x86_64 \
        -machine ubuntu,accel=kvm \
        -smp $(CPUS) \
        -m $(MEMS) \
        -hda $(IMAGE_PATH) \
	    -serial stdio \
        -nographic

kernel_boot:


clean:
	rm $(IMAGE_PATH)
