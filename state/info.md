# State 
- Contains state snapshots after instruction set benchmarks have been run
    - Benchmarks: SPECrate int benchmarks with base metrics (excluding ones that return errors)
    - State snapshots: outputs of `/proc/$pid/maps`, `gdb info proc mappings`, and `gdb info registers` after each process called by the benchmark(s) being run has completed
- Pairwise core testing
    - $n and $m refer to the two cores
- Code that creates these files
    ```
    > do_testing.sh
    |   > calls run_test.sh
    |   |   > calls `runcpu` commands
    |   > calls run_log.sh
    |   |   > calls run_gdb.sh
    |   |   |   > gets `/proc/$pid/maps`, `gdb info proc mappings`, 
    |   |   |   | and `gdb info registers` data after each process 
    |   |   |   | called by the benchmark(s) being run has completed
    ```

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
