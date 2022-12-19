#!/bin/bash

fn=$1
echo "fn=$1"
core=$2
echo "core=$2"
pid=$3
echo "pid=$3"

sudo gdb -batch-silent \
    -p $pid \
    -ex "set logging file /proj/final-project/state/$fn/gdb-c$core-p$pid.log" \
    -ex "set logging on" \
    -ex "dir /proj/final-project/glibc-2.31/sysdeps" \
    -ex "catch syscall exit_group" \
    -ex "c" \
    -ex "info proc mappings" \
    -ex "info registers" \
    -ex "shell cat /proc/$pid/maps > /proj/final-project/state/$fn/proc-maps-c$core-p$pid.log" \
    -ex "c" \
    -ex "quit"
