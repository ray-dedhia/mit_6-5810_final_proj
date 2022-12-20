# Files

## Code
```
> setup.sh
> do_testing.sh
|   > calls run_test.sh
|   |   > calls `runcpu` commands
|   > calls run_log.sh
|   |   > proesses `/proc/$pid/maps` and gets memory dumps
> MyConfig.cfg
|   > configurations for runcpu commands
```

## State
See state folder for state snapshot data.
