#!/bin/sh

# TODO
# - copy over files
#   - specccpu_2017.iso and setup.sh to /local
#   - .bash_profile, .tmux.conf, and .vimrc to ~/
#   - MyConfig.cfg to /local/spec/config
# - backup files when done
#   - /local/spec/config/MyConfig.cfg
#   - /local/setup.sh

# install compilers
sudo apt update
sudo apt install gfortran
sudo apt install golang-go

# install libc6
sudo cp /etc/apt/sources.list /etc/apt/sources.list.copy
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt update
cd /local
sudo apt source libc6

# install other packages
sudo apt install htop

# mount spec cpu iso image
cd /local
mkdir mnt
sudo mount -t iso9660 -o ro,exec,loop /local/specccpu_2017.iso /local/mnt

# install image
mkdir spec
SPEC='/local/spec'
cd mnt
./install.sh

# gdb setup
# fix https://www.mail-archive.com/ubuntu-bugs@lists.ubuntu.com/msg5895343.html
sudo mkdir /usr/lib/debug/lib64
sudo ln -s /usr/lib/debug/lib/x86_64-linux-gnu/ld-2.31.so /usr/lib/debug/lib64
