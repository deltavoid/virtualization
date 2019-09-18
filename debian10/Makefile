

Image := debian10-std.qcow2
InstallDisc := /home/zqy/Software/debian-live-10.0.0-amd64-standard.iso
VNCPort := 14
SSHPort := 14

.PHONY: run install vnc ssh

run:
	sudo qemu-system-x86_64 \
	-M pc -name "debian10-std" \
	-no-user-config \
	-enable-kvm \
	-m 4G -mem-prealloc \
	-cpu host -smp sockets=2,cores=4,threads=1 \
	-drive file=$(Image),format=qcow2,if=none,id=drive0 \
	-device virtio-blk-pci,drive=drive0,id=drive0-dev,bootindex=1 \
	-netdev user,id=vnet,hostfwd=:0.0.0.0:100$(SSHPort)-:22 \
	-device virtio-net-pci,netdev=vnet \
	-nographic \
	-vnc :$(VNCPort) \
	-boot c

vnc:
	vncviewer localhost:59$(VNCPort)

ssh:
	ssh localhost -p 100$(SSHPort)


install: $(Image)
	sudo qemu-system-x86_64 \
	-M pc -name "debian10-std" \
	-no-user-config \
	-enable-kvm \
	-m 4G -mem-prealloc \
	-cpu host -smp sockets=2,cores=4,threads=1 \
	-cdrom /home/zqy/Software/debian-live-10.0.0-amd64-standard.iso \
	-drive file=$(Image),format=qcow2,if=none,id=drive0 \
	-device virtio-blk-pci,drive=drive0,id=drive0-dev,bootindex=1 \
	-netdev user,id=vnet,hostfwd=:0.0.0.0:10027-:22 \
	-device virtio-net-pci,netdev=vnet \
	-nographic \
	-vnc :$(VNCPort) \
	-boot c


$(Image):
	qemu-img create -f qcow2 $(Image) 40g
