#!/bin/sh
sudo gdb -batch-silent \
    -p "$(pgrep python)" \
    -ex 'set logging file gdb-1.log' \
    -ex 'set logging on' \
    -ex 'dir /local/glibc-2.31/sysdeps' \
    -ex 'catch syscall exit_group' \
    -ex 'c' \
    -ex 'info proc mappings' \
    -ex 'info registers' \
    -ex 'c' \
    -ex 'quit'
