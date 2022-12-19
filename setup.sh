#!/bin/sh

# Files
# - copy over
#   - specccpu_2017.iso, setup.sh, run_gdb.sh, and run_speccpu.sh to /proj/final-project
#   - MyConfig.cfg to /proj/final-project/spec/config/
#   - .tmux.conf and .vimrc to ~/
# - backup
#   - /proj/final-project/setup.sh
#   - /proj/final-project/run_gdb.sh
#   - /proj/final-project/run_speccpu.sh
#   - /proj/final-project/spec/config/MyConfig.cfg

# install compilers
sudo apt update
sudo apt install gfortran
sudo apt install golang-go

# install libc6
sudo cp /etc/apt/sources.list /etc/apt/sources.list.copy
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt update
cd /proj/final-project
sudo apt source libc6

# install other packages
sudo apt install htop

# mount spec cpu iso image
cd /proj/final-project
mkdir mnt
sudo mount -t iso9660 -o ro,exec,loop /proj/final-project/specccpu_2017.iso /proj/final-project/mnt

# install image
cd /proj/final-project
mkdir spec
SPEC='/proj/final-project/spec'
cd mnt
./install.sh -d $SPEC
