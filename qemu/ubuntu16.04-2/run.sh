


# qemu-img create -f qcow2 ubuntu.qcow2 20G

# sudo qemu-system-x86_64 \
#     -machine ubuntu,accel=kvm \
#     -smp 4 \
#     -m 8G \
#     -hda ubuntu.qcow2 \
#     -cdrom /home/zqy/Software/ubuntu-18.04.2-desktop-amd64.iso \
#     -boot d

sudo qemu-system-x86_64 \
    -machine ubuntu,accel=kvm \
    -smp 4 \
    -m 4G \
    -hda ubuntu.qcow2 \