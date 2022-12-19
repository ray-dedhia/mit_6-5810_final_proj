## SPEC-CPU Notes

### Links 

#### SPEC CPU
- [Install SPEC-CPU on Linux](https://www.spec.org/cpu2017/Docs/install-guide-unix.html)
- [SPEC CPU 2017 Overview](https://www.spec.org/cpu2017/Docs/overview.html#Q16)
- [SPEC CPU 2017 System Requirements](https://www.spec.org/cpu2017/Docs/system-requirements.html#MultipleCPUs)
- [SPEC CPU 2017 Config Files](https://www.spec.org/cpu2017/Docs/config.html#hw_ncores)
- [Using the RUNCPU Command](https://www.spec.org/cpu2017/Docs/runcpu.html#action)
    - [Actions](https://www.spec.org/cpu2017/Docs/runcpu.html#action)
- [RUNCPU Avoidance](https://www.spec.org/cpu2017/Docs/runcpu-avoidance.html)

#### Other
- [`/proc/$pid/maps`](https://stackoverflow.com/questions/1401359/understanding-linux-proc-pid-maps-or-proc-self-maps)

### RUNCPU Command
- Syntax: `runcpu [options] [list of benchmarks to run]`
- How it works
    - Spawns multiple child processes, which run SPEC CPU
    - PID of child processes change over execution

### Benchmarks

#### Action=Validate (default)
- `runcpu --config=MyConfig --noreportable 500.perlbench_r 520.omnetpp_r 523.xalancbmk_r 525.x264_r`
    - Setup errors: `525.x264_r(base)`

#### Action=Build
- `SPECrate` floating point benchmarks with base metrics
    - Command: `runcpu --config=MyConfig --action=build SPECrate2017_fp_base`
    - Benchmarks selected: `503.bwaves_r, 507.cactuBSSN_r, 508.namd_r, 510.parest_r, 511.povray_r, 519.lbm_r, 521.wrf_r, 526.blender_r, 527.cam4_r, 538.imagick_r, 544.nab_r, 549.fotonik3d_r, 554.roms_r, 997.specrand_fr`
    - Command stalled
        - Benchmarks that worked:
            - 503.bwaves_r base mytest-m64
            - 507.cactuBSSN_r base mytest-m64
            - 508.namd_r base mytest-m64
            - 511.povray_r base mytest-m64
            - 519.lbm_r base mytest-m64
        - Benchmarks that gave errors:
            - 510.parest_r base mytest-m64
        - Benchmark that stalled (10+ minutes):
            - 521.wrf_r base mytest-m64
- `SPECrate` int benchmarks with base metrics
    - Command: `runcpu --config=MyConfig --action=build SPECrate2017_int_base`
    - Benchmarks selected: `500.perlbench_r, 502.gcc_r, 505.mcf_r, 520.omnetpp_r, 523.xalancbmk_r, 525.x264_r, 531.deepsjeng_r, 541.leela_r, 548.exchange2_r, 557.xz_r, 999.specrand_ir`
    - Build successes for intrate: 500.perlbench_r(base), 520.omnetpp_r(base), 523.xalancbmk_r(base), 525.x264_r(base), 531.deepsjeng_r(base), 541.leela_r(base), 548.exchange2_r(base), 557.xz_r(base), 999.specrand_ir(base)
    - Build errors for intrate: 502.gcc_r(base; CE)
- `SPECrate` int benchmarks with peak metrics
    - Command: `runcpu --config=MyConfig --action=build SPECrate2017_int_peak`
    - Benchmarks selected: `500.perlbench_r, 502.gcc_r, 505.mcf_r, 520.omnetpp_r, 523.xalancbmk_r, 525.x264_r, 531.deepsjeng_r, 541.leela_r, 548.exchange2_r, 557.xz_r, 999.specrand_ir`

## CloudLab

### Snapshots
- [Docs](https://docs.cloudlab.us/cloudlab-manual.html)
- Directories included in snapshots: `/local`, `/data`, and `/opt`
