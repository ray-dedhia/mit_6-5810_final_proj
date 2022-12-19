# State 
- Contains state snapshots after instruction set benchmarks have been run
    - Each benchmark is run as several processes
        - Using the SPECrate int benchmarks with base metrics (excluding the ones that return errors)
    - When each process completes, get output of `/proc/$pid/maps` and process it
- Pairwise core testing
    - $n and $m refer to the two cores
- Note: the CloudLab machine (`c220g5`) contains 40 cores

## one-benchmark
- Output after running one benchmark in the instruction set over two cores via bash forking
    - Benchmark: `500.perlbench.r(base)`
- Command: `(taskset --cpu-list $n runcpu --config=MyConfig --noreportable 500.perlbench_r) & (taskset --cpu-list $m runcpu --config=MyConfig --noreportable 500.perlbench_r)`

### test-n-m

## eight-benchmarks
- Output after running eight benchmark in the instruction set over two cores via bash forking
    - Benchmarks: `500.perlbench_r(base), 520.omnetpp_r(base), 523.xalancbmk_r(base), 531.deepsjeng_r(base), 541.leela_r(base), 548.exchange2_r(base), 557.xz_r(base), 999.specrand_ir`
- Command: `(taskset --cpu-list $n runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 999.specrand_ir) & (taskset --cpu-list $m runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 999.specrand_ir)`

