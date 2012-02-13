#! /bin/bash

# Skip rest of script on neccessary condition

. ./tapper-autoreport --import-utils

require_cpufeature SUPERAFFEZOMTECVERYSTRANGEVALUE
this_code_will_never_be_reached

grep SUPERAFFEZOMTECVERYSTRANGEVALUE /proc/cpuinfo
ok_or_skipall $? "Found very strange required value in /proc/cpuinfo"

echo "Dangerous area here!"
grep DANGEROUSSTRING /proc/cpuinfo

. ./tapper-autoreport

