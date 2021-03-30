# Core Dump ROS Nodes
Alternative to trying to attach to it before it crashes or using the gdb launch prefix.

1. Probably want to build at least some things in debug `catkin build --cmake-args -DCMAKE_BUILD_TYPE=Debug`
2. Set the core filename to use the pid process by default. `echo 1 | sudo tee /proc/sys/kernel/core_uses_pid ...`
3. Set the core size to unlimited. You may want to add this to the bashrc since it has to be set in the terminal you launch the node from. `ulimit -c unlimited`

Now you just run your code. If it crashes, look in ~/.ros for something along the lines of core.1234. Then convert that to a more useful backtrace with `gdb path_to/executable path_to/core.1234`. In my example this is  `gdb ~/code/robot/devel/lib/pkg_name/pkg_executable .ros/core.67888`. In QtCreator you can also load that core file using Debug/Start Debugging/Load Core File. 
