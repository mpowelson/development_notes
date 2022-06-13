
## Perf
Change `/proc/sys/kernel/perf_event_paranoid` to something below 4. -1 will work.

Change `/proc/sys/kernel/kptr_restrict` to 0

Run `sudo mount -o remount,mode=755 /sys/kernel/tracing/`

See [here](https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html#privileged-perf-users-groups) for a method of creating a user group for this
## Orbit



## Wallclock Profiler



