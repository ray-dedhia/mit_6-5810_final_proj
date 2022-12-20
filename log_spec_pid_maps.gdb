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
while ($ln < $flen)
    python fline=open("tmpfile").readline().rstrip().split(); gdb.execute("set $start_hex = \"" + fline[0] + "\""); gdb.execute("set $stop_hex = \"" + fline[1] + "\"")
    eval "set $start_num=0x%s", $start_hex
    eval "set $stop_num=0x%s", $stop_hex
    eval "dump memory proc-maps-r%s-%s.log %ld %ld", $start_hex, $stop_hex, $start_num, $stop_num
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
