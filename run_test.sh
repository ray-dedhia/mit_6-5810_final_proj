#!/bin/bash

cpu1=$1
cpu2=$2
(taskset --cpu-list $1 runcpu --config=MyConfig --noreportable 500.perlbench_r) & (taskset --cpu-list $2 runcpu --config=MyConfig --noreportable 500.perlbench_r)
