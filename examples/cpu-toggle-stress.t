#!/bin/bash

# This script stresses the on/offline path of all cores randomly.

. ./bash-test-utils

require_root
require_file /sys/devices/system/cpu/cpu1/online "at least one CPU can be toggled on/off"
require_program netcat

maxcounter=${CPUTOGGLE_MAXCOUNTER:-1000}
counter=0
cores=`grep -c bogomips /proc/cpuinfo`

cleanup() {
    append_tapdata "cpu_toggle_counter: $counter"
    for i in $(find /sys/devices/system/cpu/cpu* -name online); do
        append_comment "cleanup ${i}"
        if [ $(cat $i) == 0 ]; then
            echo 1 > $i
        fi
    done
}

while [ $counter -lt $maxcounter ] ; do
    cpu=$(( $RANDOM % $cores ))
    if [ $cpu -ne 0 ]; then
        state=`cat /sys/devices/system/cpu/cpu${cpu}/online`
        if [ $state -eq 0 ]; then
            echo 1 > /sys/devices/system/cpu/cpu${cpu}/online
        else
            echo 0 > /sys/devices/system/cpu/cpu${cpu}/online
        fi
    fi
    let counter=$counter+1
done

cleanup

done_testing

# vim: set ts=4 sw=4 tw=0 ft=sh:
