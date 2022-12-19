#!/bin/bash

# wait until done building
pid="$(pgrep -f ^../run_base_refrate)"
while [ "$pid" = "" ]
do
    pid="$(pgrep -f ^../run_base_refrate)"
done
echo "PID=$pid"

# start logging
sudo gdb -batch-silent \
    -p $pid \
    -ex "set logging file /local/gdb-c$1.log" \
    -ex "set logging on" \
    -ex "dir /local/glibc-2.31/sysdeps" \
    -ex "catch syscall exit_group" \
    -ex "c" \
    -ex "info proc mappings" \
    -ex "info registers" \
    -ex "shell cat /proc/$pid/maps > /local/proc-maps-c$1.log" \
    -ex "c" \
    -ex "quit"
