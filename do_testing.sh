#!/bin/bash

cd /proj/final-project/spec
source shrc

for i in {0..39..2}
do 
    # state snapshotting
    sudo bash /proj/final-project/run_log.sh &

    # pairwise core testing
    cpu1=$i
    cpu2=$(($i + 1))
    sudo bash run_test.sh $cpu1 $cpu2
done
