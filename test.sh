#!/bin/bash

(taskset --cpu-list 0 runcpu --config=MyConfig --noreportable 500.perlbench_r) & (taskset --cpu-list 1 runcpu --config=MyConfig --noreportable 500.perlbench_r)
