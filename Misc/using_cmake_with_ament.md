# Using CMake with Ament

This is an attempt to put the information in [THIS](https://index.ros.org/doc/ros2/Tutorials/Ament-CMake-Documentation/) wiki page into an example using the recommended methods for using Ament.

```
cmake_minimum_required(VERSION 3.5.0)
project(example_project VERSION 0.1.0 LANGUAGES CXX)
 
# Find all dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
 
find_package(Eigen3 REQUIRED)
find_package(PCL REQUIRED)
add_definitions(${PCL_DEFINITIONS})
 
find_package(geometry_msgs REQUIRED)
 
 
# Targets
add_library(${PROJECT_NAME} SHARED src/example_project.cpp)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD 14)
target_include_directories(${PROJECT_NAME} PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
    "$<INSTALL_INTERFACE:include>")
ament_target_dependencies(${PROJECT_NAME}
  rclcpp
  Eigen3
  PCL
  geometry_msgs)
 
 
add_executable(${PROJECT_NAME}__node src/example_project_node.cpp)
target_link_libraries(${PROJECT_NAME}_node ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME}_node PROPERTIES CXX_STANDARD 14)
target_include_directories(${PROJECT_NAME}_node PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
    "$<INSTALL_INTERFACE:include>")
 
# Install Targets
install(
  TARGETS ${PROJECT_NAME}  ${PROJECT_NAME}_node
  EXPORT ${PACKAGE_NAME}-targets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)
 
ament_export_interfaces(${PACKAGE_NAME}-targets)
 
install(DIRECTORY include/
  DESTINATION include
  FILES_MATCHING PATTERN "*.h"
)
 
# Set up testing
if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()
 
# Set up Ament
ament_export_dependencies(
  rclcpp
  Eigen3
  PCL
  geometry_msgs)
 
ament_package()
```
