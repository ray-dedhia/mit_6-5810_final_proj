#!/bin/bash

cd /proj/final-project/spec
source shrc

for i in {0..39..2}
do 
    # pairwise core testing
    cpu1=$i
    cpu2=$(($i + 1))
    sudo bash run_test.sh $cpu1 $cpu2

    # state snapshotting
    fn="test-$cpu1-$cpu2"
    mkdir /proj/final-project/state/$fn
    sudo bash /proj/final-project/run_log.sh $fn
done
