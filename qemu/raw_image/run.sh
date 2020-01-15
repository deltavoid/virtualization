
sudo qemu-system-x86_64 -m 512 -smp 4 -kernel vmlinuz-5.0.0-25-generic 

# qemu-img create -f raw disk.raw 512M

# mkfs -t ext4 ./disk.raw

# sudo mount -o loop ./disk.raw ./img