#!/bin/bash

fn=$1
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
    echo "child pids=$pids"
    set -- $pids
    pid1=$1
    pid2=$2
    if [ "$pid2" = "" ]
    then
        continue
    fi
    echo "pid1 = $pid1"
    echo "pid2 = $pid2"

    # get core; stop if core not found
    core1="$(ps -o psr -p $pid1 | tail -1)"
    core2="$(ps -o psr -p $pid2 | tail -1)"
    if [ "$core1" = "PSR" ] || [ "$core2" = "PSR" ]
    then
        continue
    fi
    echo "core1 = $core1"
    echo "core2 = $core2"
    echo $fn

    # do state logging
    bash run_gdb.sh $fn $core1 $pid1 & bash run_gdb.sh $fn $core2 $pid2
done

echo "Done"
