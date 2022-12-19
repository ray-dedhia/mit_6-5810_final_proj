#!/bin/bash

core=$1
pid=$2

sudo gdb -batch-silent \
    -p $pid \
    -ex "set logging file /local/state/core$core/gdb-c$core-p$pid.log" \
    -ex "set logging on" \
    -ex "dir /local/glibc-2.31/sysdeps" \
    -ex "catch syscall exit_group" \
    -ex "c" \
    -ex "info proc mappings" \
    -ex "info registers" \
    -ex "shell cat /proc/$pid/maps > /local/state/core$core/proc-maps-c$core-p$pid.log" \
    -ex "c" \
    -ex "quit"
