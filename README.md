# Files

## Code
```
> setup.sh
> do_testing.sh
|   > calls run_test.sh
|   |   > calls `runcpu` commands
|   > calls run_log.sh
|   |   > calls run_gdb.sh
|   |   |   > gets `/proc/$pid/maps`, `gdb info proc mappings`,
|   |   |   | and `gdb info registers` data after each process
|   |   |   | called by the benchmark(s) being run has completed
> MyConfig.cfg
|   > configurations for runcpu commands
```

## State
See state folder for state snapshot data.
