# Instructions

## Main
- Setup
    - `setup.sh`
- Run instruction set
    - `taskset --cpu-list 0 runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 531.deepsjeng_r 541.leela_r 548.exchange2_r 557.xz_r 999.specrand_ir`
    - Use `taskset` to limit which CPU cores are being used
    - Running SPECrate int benchmarks with base metrics (excluding ones that return errors)
- State
    - Get PID
        - `ps -x --forest`
        - `pgrep -f ^../run_base_refrate`
    - Attach gdb to command: `sudo gdb -p $pid`
    - Create catchpoint at exit_group syscall: `catch syscall exit_group`
    - Get state info:
        - `info proc mappings`
        - `info registers`
    - Get `/proc/$pid/maps`:
        - `shell`
        - `cat /proc/$pid/maps`
        - `exit`
    - Exit and attach gdb to next command

## MyConfig.cfg
- `cat /proc/cpuinfo`
- `lscpu`
- `lsb_release -a`
