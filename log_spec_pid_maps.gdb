# get vars
set $pid=(int)getpid()
eval "set $f1 = \"/proj/final-project/state/vars/p%d\"", $pid
eval "cd %s", $f1
python core=open("core").readline().rstrip(); gdb.execute("set $core = " + core)

# catch exit_group
dir /proj/final-project/glibc-2.31/sysdeps
catch syscall exit_group
c

# get /proc/$pid/maps
eval "set $f2 = \"/proj/final-project/state/c%d-p%d\"", $core, $pid
eval "cd %s", $f2
eval "set $f3 = \"/proc/%d/maps\"", $pid
eval "shell grep r[-w]-p /proc/%d/maps | awk '{print $1;}' | tr - ' ' > tmpfile", $pid
python nl = str(len(open("tmpfile").readlines())); gdb.execute("set $flen = " + nl)

# dump memory
set $ln=0
while ($line < $flen)
    python fline=open("tmpfile").readline().rstrip().split(); gdb.execute("set $start = " + fline[0]); gdb.execute("set $stop = " + fline[1])
    dump memory proc-maps-r$start-$stop.log 0x$start 0x$stop
    set $ln=$ln+1
end

# exit
c
quit

# extra logging
# set logging file /proj/final-project/state/gdb-c$core-p$pid.log
# set logging on
# info proc mappings
# info registers
