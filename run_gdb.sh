#!/bin/bash

# get main process id
x="$(pgrep -f '^specperl -I/local/spec/bin/common')"
mainpid="$(echo $x | awk '{print $1;}')"

# while runcpu running
while [ -d /proc/$mainpid ]
do
    # get child process id
    pid="$(pgrep -f ^../run_base_refrate)"
    while [ "$pid" = "" ]
    do
        pid="$(pgrep -f ^../run_base_refrate)"
    done
    echo "PID=$pid"

    # start logging
    sudo gdb -batch-silent \
        -p $pid \
        -ex "set logging file /local/state/gdb-c$1-p$pid.log" \
        -ex "set logging on" \
        -ex "dir /local/glibc-2.31/sysdeps" \
        -ex "catch syscall exit_group" \
        -ex "c" \
        -ex "info proc mappings" \
        -ex "info registers" \
        -ex "shell cat /proc/$pid/maps > /local/state/proc-maps-c$1-p$pid.log" \
        -ex "c" \
        -ex "quit"
done
