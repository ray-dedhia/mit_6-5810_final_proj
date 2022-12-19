#!/bin/bash
cpu1=$1
cpu2=$2
(taskset --cpu-list $cpu1 runcpu --config=MyConfig --noreportable 500.perlbench_r) & (taskset --cpu-list $cpu2 runcpu --config=MyConfig --noreportable 500.perlbench_r)

#taskset --cpu-list $1 runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 999.specrand_ir
