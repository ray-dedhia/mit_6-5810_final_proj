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
    -ex "shell grep r[-w]-p /proc/$pid/maps \
         | sed -n 's/^\([0-9a-f]*\)-\([0-9a-f]*\) .*$/\1 \2/p' \
         | while read start stop; do \
            gdb --batch --pid $pid -ex \
            "dump memory /proj/final-project/state/$fn/proc-maps-c$core-p$pid-r$start-$stop.log 0x$start 0x$stop"; done
    -ex "c" \
    -ex "quit"

# extra logging
# -ex "shell cat /proc/$pid/maps > /proj/final-project/state/$fn/proc-maps-c$core-p$pid.log" \
# -ex "info proc mappings" \
# -ex "info registers" \
