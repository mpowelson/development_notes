# Types of Profilers
This focuses on profilers for C++ on Linux
## Sampling

* Attach to program, periodically interrupt and record stack trace
* Sampling frequency is customizeable
* Results are statistical averges
* Examples: vTune
* Only needs to be able to read stack trace
* Inlined functions are usually invisble

Mostly taken from Reference 3 - Not convinced this is the best reference

## Instrumented

* Add code hooks to explicitly record metrics
* Can provide both average and exact breakdown by execution frame
* Not affected by inlining or statistical anomalies
* Examples: Optick
* Requires adding collection macros in tactical places in the code
* Supports adding extra business metadata
* Can fallback on sampling

Note that instrumentation can happen at [lots of different levels](https://en.wikibooks.org/wiki/Introduction_to_Software_Engineering/Testing/Profiling). It can be anything from manual annotations made by the developer to compiler assisted flags, to runtime injection.

Mostly taken from Reference 3 - Not convinced this is the best reference

## Hypervisor/Simulator

Data collected by running the unmodified program under a simulator or hypervisor. See [here](https://en.wikipedia.org/wiki/Profiling_(computer_programming)#Hypervisor/Simulator)

# Open Source Profiler Options
### gperftools
Sampling profiler

Issues: Known bug in glibc can cause segfaults on 64 bit systems (as of glibc 2.4 - 2.31 is default on 20.04 (ldd --version)).

Results can be visualized with KCachegrind

### Gprof
This samples to get statistics, but it does use compiler instrumentation to count the function calls (`gcc -pg`). However, it is not manually instrumented like others

### Perf
"Perf is a performance analyzing tool in Linux, available from Linux kernel version 2.6.31 in 2009. Userspace controlling utility, named perf, is accessed from the command line and provides a number of subcommands; it is capable of statistical profiling of the entire system (both kernel and userland code)" ([source](https://en.wikipedia.org/wiki/Perf_(Linux))

Can be visualized with 
* [Hotspot](https://github.com/KDAB/hotspot)
* [QTC cpu usage analyzer](https://doc.qt.io/qtcreator/creator-cpu-usage-analyzer.html)

### OProfile
[Sampling profiler](https://oprofile.sourceforge.io/about/)

"OProfile leverages the hardware performance counters of the CPU to enable profiling of a wide variety of interesting statistics, which can also be used for basic time-spent profiling. All code is profiled: hardware and software interrupt handlers, kernel modules, the kernel, shared libraries, and applications. Several post-profiling tools for turning profile data into human readable information are available."

"OProfile has a typical overhead of 1-8%, dependent on sampling frequency and workload."


### Callgrind
Various sources seem to categorize this differently. From what I read, it sounds like it would be a simulator profiler. It apparently runs the application on a virtual cpu and records how often things happen. This means it is highly accurate, but it is also extremly slow (~50x slower)

### VTune
[Intel® VTune™ Profiler optimizes application performance, system performance, and system configuration for HPC, cloud, IoT, media, storage, and more.](https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html#gs.2mu6m2)

### Easy Profiler (MIT)
[Easy_profiler](https://github.com/yse/easy_profiler) - High level instrumented compiler where you add blocks like EASY_FUNCTION to manually label points and functions of interest. 

Can [dump data to a file](https://github.com/yse/easy_profiler#dump-to-file). Includes a visualizer

### Swri Profiler (BSD 3-Clause)
[Custom instrumented profiler](https://github.com/swri-robotics/swri_profiler) geared towards ROS nodes. Looks like it publishes results on topics and is made to run mostly live or from bags.

Instrument functions like `SWRI_PROFILE("run-state-estimator");`


## Orbit (BSD 2-Clause)
[Profiler by Google](https://github.com/google/orbit). Looks like it is intended to be run live.

"The key differentiator with many existing tools is that no alteration to the target process is necessary. Orbit does not require you to change a single line of code. It doesn't require you to recompile or even relaunch the application you want to profile. Everything is done seamlessly, right when you need it. It requires zero integration time and zero iteration time.

Orbit combines sampling and dynamic instrumentation to optimize the profiling workflow. Sampling can quickly identify interesting functions to instrument. Dynamic instrumentation results in exact function entry and exit information which is presented in the form of per-thread hierarchical call graphs. Scheduling events are also shown to visualize when a thread was running and on what core." 

### Coz (BSD 2-Clause)
A ["causal profiler"](https://github.com/plasma-umass/coz). Manually instrumented with points that you want to happen frequently or blocks that should happen quickly. Then it experiments and finds what the impact would be if you optimized certain blocks of code. It seems pretty academic. Resulted in a 2015 paper.

### Optick (MIT)
[Profiler for games](https://github.com/bombomby/optick). Looks to be a manually instrumented profiler. Add blocks like `OPTICK_EVENT();`. It apparently does something with GPUs too when using Vulkan.

### Tracy (BSD 3-Clause)
["A real time, nanosecond resolution, remote telemetry, hybrid frame and sampling profiler for games and other applications."](https://github.com/wolfpld/tracy)


# Paid Profiler Options
* [GProfiler](https://gprofiler.io/?ref=gprofiler&utm_campaign%20gprofiler_north_america&utm_medium%20cpc&utm_source%20google&utm_term%20continuous%20profiling&utm_content%20{content})




# Interesting References

1. [Google-Wide Profiling: A Continuous Profling Infrastructure for Data Centers](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/36575.pdf)
2. [Continuous Profiling in Production: What, Why, How](https://www.infoq.com/presentations/cotinuous-profiling-production/)
3. [The Basics of Profiling - Mathieu Ropert - CppCon 2021](https://www.youtube.com/watch?v=dToaepIXW4s)
4. [Summary of different types of profiling tools for a class by Raj Jain at Washington University](https://www.cs.wustl.edu/~jain/cse567-06/ftp/sw_monitors1/#sec2.5)



