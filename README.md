# tapper-autoreport

## ABOUT

`tapper-autoreport` is a "bash include file" you can add ("source") at
the end of your own bash script.

It then magically turns your bash script into a "**Tapper test
suite**".

It also allows your bash script to be executed locally via the `prove`
command, a standard tool to run test scripts that produce TAP output
("Test Anything Protocol") -- without requiring an actual Tapper
framework.

Due to that and no other external dependecies it's a good starting
point to write actual **function tests** that are reusable.

It collects meta information from system, reports test results and can
upload logs and other files over network to a
[Tapper server](http://github.com/tapper/Tapper-Reports-Receiver).

## SYNOPSIS

### An autoreport based script

```bash
 #! /bin/bash
 . /tapper-autoreport --import-utils
 # your own stuff here ...
 . /tapper-autoreport
```

### Run via 'prove' (a standard test utility)

The tool `prove` is a standard tool available in every Linux
distribution. This executes the script locally and reports success:

```bash
 $ prove ./trivial-example-1.sh
 ./trivial-example-1.sh .. ok
 All tests successful.
 Files=1, Tests=5, 20 wallclock secs
 Result: PASS
```


### Run directly to report to Tapper

This runs the test script which then sends test report to a Tapper
server:

```bash
 $ ./trivial-example-1.sh
 # http://tapper/tapper/reports/id/129218
 # - upload ./trivial-example-1.sh ...
 # - upload /boot/config-2.6.32-22-generic ...
 # - upload /proc/cpuinfo ...
 # - upload /proc/devices ...
 # - upload /proc/version ...
```

### More info

For more info please read
[autoreport manual](https://github.com/tapper/Tapper-autoreport/blob/master/autoreport-manual.md).
