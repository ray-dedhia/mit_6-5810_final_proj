#!/bin/sh

# TODO
# - copy over files
#   - specccpu_2017.iso to /local
#   - .bash_profile, .tmux.conf, and .vimrc to ~/
#   - MyConfig.cfg to /local/spec/config
# - backup files when done
#   - /local/spec/config/MyConfig.cfg
#   - /local/setup.sh

# install fortran compiler
sudo apt update
sudo apt install gfortran

# install go compiler
sudo apt install golang-go

# mount spec cpu iso image
cd /local
mkdir mnt
sudo mount -t iso9660 -o ro,exec,loop /local/specccpu_2017.iso /local/mnt

# install image
mkdir spec
SPEC='/local/spec'
cd mnt
./install.sh

# set paths
cd /local/spec
source shrc
