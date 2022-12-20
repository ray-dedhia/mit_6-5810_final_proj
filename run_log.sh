#!/bin/bash

mainpid="$(pgrep -f '/bin/bash ./run_test.sh')"
echo "mainpid=$mainpid"

while true
do
    # wait until main process starts
    if [ "$mainpid" = "" ]
    then
        continue
    fi

    # stop when main process ends
    if ! [ -d /proc/$mainpid ] 
    then
        break
    fi

    # get child process ids
    pids="$(pgrep -f ^../run_base_refrate)"
    if [ "$pids" = "" ]
    then
        continue
    fi
    set -- $pids
    pid1=$1
    pid2=$2
    if [ "$pid2" = "" ]
    then
        continue
    fi

    # get core; stop if core not found
    core1="$(ps -o psr -p $pid1 | tail -1)"
    core2="$(ps -o psr -p $pid2 | tail -1)"
    if [ "$core1" = "PSR" ] || [ "$core2" = "PSR" ]
    then
        continue
    fi

    # store gdb variables
    cd /proj/final-project/state/vars/
    mkdir -p p$pid1
    echo $core1 > /proj/final-project/state/vars/p$pid1/core
    mkdir -p p$pid2
    echo $core2 > /proj/final-project/state/vars/p$pid2/core

    # create directories for state logging
    cd /proj/final-project/state
    sdir1="c${core1// /}-p$pid1"
    mkdir -p $sdir1
    sdir2="c${core2// /}-p$pid2"
    mkdir -p $sdir2

    # do state logging
    sudo gdb -batch-silent -p $pid1 -x /proj/final-project/log_spec_pid_maps.gdb & sudo gdb -batch-silent -p $pid2 -x /proj/final-project/log_spec_pid_maps.gdb
done

echo "Done"
