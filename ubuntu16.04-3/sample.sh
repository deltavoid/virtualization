
IMAGE=/var/lib/libvirt/images/ubuntu18.04-1.qcow2


/usr/bin/kvm-spice \
    -name guest=ubuntu18.04-1,debug-threads=on \
    -S \
    -object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-1-ubuntu18.04-1/master-key.aes \
    -machine pc-i440fx-bionic,accel=kvm,usb=off,vmport=off,dump-guest-core=off \
    -cpu Broadwell-noTSX-IBRS \
    -m 8192 \
    -realtime mlock=off \
    -smp 4,sockets=4,cores=1,threads=1 \
    -uuid 8113338b-db4e-448d-a581-e8870b5a8d57 \
    -no-user-config \
    -nodefaults \
    -chardev socket,id=charmonitor,path=/var/lib/libvirt/qemu/domain-1-ubuntu18.04-1/monitor.sock,server,nowait \
    -mon chardev=charmonitor,id=monitor,mode=control \
    -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay \
    -no-hpet \
    -no-reboot \
    -global PIIX4_PM.disable_s3=1 \
    -global PIIX4_PM.disable_s4=1 \
    -boot strict=on \
    -device ich9-usb-ehci1,id=usb,bus=pci.0,addr=0x5.0x7 \
    -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,bus=pci.0,multifunction=on,addr=0x5 \
    -device ich9-usb-uhci2,masterbus=usb.0,firstport=2,bus=pci.0,addr=0x5.0x1 \
    -device ich9-usb-uhci3,masterbus=usb.0,firstport=4,bus=pci.0,addr=0x5.0x2 \
    -device virtio-serial-pci,id=virtio-serial0,bus=pci.0,addr=0x6 \
    -drive file=$IMAGE,format=qcow2,if=none,id=drive-virtio-disk0 \
    -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x7,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=2 \
    -drive file=/home/zqy/Software/ubuntu-18.04.2-desktop-amd64.iso,format=raw,if=none,id=drive-ide0-0-0,readonly=on \
    -device ide-cd,bus=ide.0,unit=0,drive=drive-ide0-0-0,id=ide0-0-0,bootindex=1 \
    -netdev tap,fd=26,id=hostnet0,vhost=on,vhostfd=28 \
    -device virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:48:e0:5a,bus=pci.0,addr=0x3 \
    -chardev pty,id=charserial0 \
    -device isa-serial,chardev=charserial0,id=serial0 \
    -chardev spicevmc,id=charchannel0,name=vdagent \
    -device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=com.redhat.spice.0 \
    -device usb-tablet,id=input0,bus=usb.0,port=1 \
    -spice port=5900,addr=127.0.0.1,disable-ticketing,image-compression=off,seamless-migration=on \
    -device qxl-vga,id=video0,ram_size=67108864,vram_size=67108864,vram64_size_mb=0,vgamem_mb=16,max_outputs=1,bus=pci.0,addr=0x2 \
    -device intel-hda,id=sound0,bus=pci.0,addr=0x4 \
    -device hda-duplex,id=sound0-codec0,bus=sound0.0,cad=0 \
    -chardev spicevmc,id=charredir0,name=usbredir \
    -device usb-redir,chardev=charredir0,id=redir0,bus=usb.0,port=2 \
    -chardev spicevmc,id=charredir1,name=usbredir \
    -device usb-redir,chardev=charredir1,id=redir1,bus=usb.0,port=3 \
    -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x8 \
    -msg timestamp=on

