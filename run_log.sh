#!/bin/bash

core=$1

while true
do
    # get child process id
    pids="$(pgrep -f ^../run_base_refrate)"
    while [ "$pid" = "" ]
    do
        pids="$(pgrep -f ^../run_base_refrate)"
    done
    echo "Child PIDs=$pids"

    # start logging
    set -- $pids
    pid1=$1
    pid2=$2

    bash run_gdb.sh $core $pid1 & bash run_gdb.sh $core $pid2
done
