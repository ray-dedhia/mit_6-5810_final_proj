# Instructions
- Setup
    - `setup.sh`
- Run instruction set
    - `taskset --cpu-list N runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 999.specrand_ir`
    - Use `taskset` to limit which CPU cores are being used
    - Running SPECrate int benchmarks with base metrics (excluding ones that return errors)
- State
    - Process information stored in /proc/<pid>/maps
    - Get process <pid> from `top` command
