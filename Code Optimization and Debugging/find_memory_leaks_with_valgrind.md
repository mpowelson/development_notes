# Finding Memory Leaks with Valgrind
## mem-check
**1. Install Valgrind**

```
sudo apt install valgrind
```

**2. Build in Debug**

```
catkin build --cmake-args -DCMAKE_BUILD_TYPE=Debug
```

**3. Run Valgrind**

Option 1) Standalone executable:

```
valgrind --leak-check=full  --show-leak-kinds=all  --track-origins=yes  --verbose  --log-file=valgrind-out.txt  ./executable_name
```


Option 2) On ROS Node

Add launch prefix to node following this example. Note that this will cause the node to run very slowly. This could cause issues if, for example, it causes an action to not return in the amount of time other nodes expect
 
```
<node name   = "node_name"
        pkg    = "pkg_name"
        type   = "node_type"
        output = "screen"
        required = "true"
        launch-prefix="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out-%p.txt">
```

**4. Diagnose problem**

Open the output file. Somewhere there will be a leak summary. In general, I believe “Still reachable” is probably fine. Any of the “lost” terms are bad.

 
```
==26068== LEAK SUMMARY:
==26068==    definitely lost: 12,928 bytes in 228 blocks
==26068==    indirectly lost: 0 bytes in 0 blocks
==26068==      possibly lost: 0 bytes in 0 blocks
==26068==    still reachable: 57,832 bytes in 817 blocks
==26068==         suppressed: 0 bytes in 0 blocks
```

Search for the word “lost”. There should be a line number where you can begin your investigation.

```
==26068== 10,192 bytes in 182 blocks are definitely lost in loss record 64 of 64
==26068==    at 0x483BE63: operator new(unsigned long) (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==26068==    by 0x7A75F6E: sco::OSQPModel::addVar(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) (osqp_interface.cpp:49) <--- See this line number
==26068==    by 0x79EA6F4: sco::Model::addVar(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&, double, double) (solver_interface.cpp:103)
==26068==    by 0x7A13077: sco::OptProb::createVariables(std::vector<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > > const&, std::vector<double, std::allocator<double> > const&, std::vector<double, std::allocator<double> > const&) (modeling.cpp:179)
==26068==    by 0x768DCA0: trajopt::TrajOptProb::TrajOptProb(int, trajopt::ProblemConstructionInfo const&) (problem_description.cpp:569)
==26068==    by 0x768C0A7: trajopt::ConstructProblem(trajopt::ProblemConstructionInfo const&) (problem_description.cpp:445)
==26068==    by 0x65C30B5: tesseract_planning::TrajOptMotionPlanner::solve(tesseract_planning::PlannerRequest const&, tesseract_planning::PlannerResponse&, bool) const (trajopt_motion_planner.cpp:137)
```


## massif
Here I have some allocators to ignore for Eigen, there are probably more that we need to add to this list

* aligned_allocator
* aligned_malloc

```
valgrind --tool=massif ./executable --massif-out-file=massif-out.txt --alloc-fn=aligned_allocator --alloc-fn=aligned_malloc
```

Install Massif Visualizer

```
sudo apt install  massif-visualizer
```
Use massif-visualizer to visualize.

```
massif-visualizer massif-out.txt
```
