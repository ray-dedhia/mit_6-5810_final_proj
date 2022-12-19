#!/bin/bash

fn=$1

while true
do
    # get child process id
    pids="$(pgrep -f ^../run_base_refrate)"
    while [ "$pids" = "" ]
    do
        pids="$(pgrep -f ^../run_base_refrate)"
    done
    echo "Child PIDs=$pids"

    # start logging
    set -- $pids
    pid1=$1
    pid2=$2

    core1="$(ps -o psr -p $pid1 | tail -1)"
    core2="$(ps -o psr -p $pid2 | tail -1)"
    bash run_gdb.sh $1 $core1 $pid1 & bash run_gdb.sh $1 $core2 $pid2
done
