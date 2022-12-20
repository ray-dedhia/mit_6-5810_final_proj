#!/bin/bash

fn=$1
echo "fn=$1"
core=$2
echo "core=$2"
pid=$3
echo "pid=$3"

sudo gdb -batch-silent \
    -p $pid \
    -ex "dir /proj/final-project/glibc-2.31/sysdeps" \
    -ex "catch syscall exit_group" \
    -ex "c" \
    -ex "shell grep r[-w]-p /proc/$pid/maps \
         | sed -n 's/^\([0-9a-f]*\)-\([0-9a-f]*\) .*$/\1 \2/p' > /proj/final-project/state/$fn/tmpfile-c$core-p$pid" \
    -ex 'python nl = str(len(open("/proj/final-project/state/'$fn'/tmpfile-c'$core'-p'$pid'").readlines())); gdb.execute("set '$flen' = " + nl)' \
    -ex "set $ln=0" \
    -ex "while ($line < $flen)" \
        -ex 'python fline=open("/proj/final-project/state/'$fn'/tmpfile-c'$core'-p'$pid'").readline().rstrip().split(); gdb.execute("set '$start' = " + fline[0]); gdb.execute("set '$stop' = " + fline[1])' \
        -ex "dump memory /proj/final-project/state/$fn/proc-maps-c$core-p$pid-r$start-$stop.log 0x$start 0x$stop" \
        -ex "set $ln=$ln+1" \
    -ex "done" \
    -ex "c" \
    -ex "quit"

# extra logging
# set logging file /proj/final-project/state/$fn/gdb-c$core-p$pid.log
# set logging on
# info proc mappings
# info registers
