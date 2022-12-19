# Files

## Code
```
> setup.sh
> do_testing.sh
|   > calls run_test.sh
|   |   > calls `runcpu` commands
|   > calls run_log.sh
|   |   > calls run_gdb.sh
|   |   |   > gets `/proc/$pid/maps` and processes it
> MyConfig.cfg
|   > configurations for runcpu commands
```

## State
See state folder for state snapshot data.
