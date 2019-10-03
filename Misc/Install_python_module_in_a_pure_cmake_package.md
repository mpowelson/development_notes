# Installing a Python Module in a Pure CMake Package

## Instructions
Assuming you have already set up your package as a pure cmake 3.5+ package, you may also want to expose Python modules to other packages. In a catkin package, you would have filled out a setup.py and called catkin_python_setup() in the CMake. Follow the directions below to set up your package so that you can still import its modules in ROS 1 packages (not tested on ROS 2).

### Package structure
The package structure below is assumed for these instructions

* scripts
    * executable_1.py
    * executable_2.py
* src
    * module_name
        * __init__.py
        * module_file_1.py
        * module_file_2.py
    * setup.py.in
    * CMakeList.txt
* CMakeLists.txt
* package.xml


### Setup.py.in
This will replace your setup.py. Note the CMake variables. These will be replaced at install time.

```
from distutils.core import setup

if __name__ == '__main__':
    setup(name='my_pkg',
          version='${PACKAGE_VERSION}',
          package_dir={ '': '${CMAKE_CURRENT_SOURCE_DIR}' },
          packages=['my_pkg'])
```

### my_pkg/src/CMakeList.txt
Here is the rough outline of what it is doing

* Finds Python
* Sets some variables that we use later
* Configures setup.py using the template setup.py.in and the appropriate CMake variables
* Runs `python setup.py build`  and waits for completion
* Runs `python setup.py install --install-lib devel/lib/python2.7/dist-packages` (for building in devel space). This installs the package alongside where catkin puts all of the msg Python modules

```
find_package(PythonInterp)

if (PYTHONINTERP_FOUND)
    set(SETUP_PY_IN "${CMAKE_CURRENT_SOURCE_DIR}/setup.py.in")
    set(SETUP_PY    "${CMAKE_CURRENT_BINARY_DIR}/setup.py")
    set(DEPS        "${CMAKE_CURRENT_SOURCE_DIR}/my_pkg/__init__.py")
    set(OUTPUT      "${CMAKE_CURRENT_BINARY_DIR}/build/timestamp")

    configure_file(${SETUP_PY_IN} ${SETUP_PY})

    add_custom_command(OUTPUT ${OUTPUT}
                       COMMAND ${PYTHON_EXECUTABLE} ${SETUP_PY} build
                       COMMAND ${CMAKE_COMMAND} -E touch ${OUTPUT}
                       DEPENDS ${DEPS})

    add_custom_target(target ALL DEPENDS ${OUTPUT})
    install(CODE "execute_process(COMMAND ${PYTHON_EXECUTABLE} ${SETUP_PY} install --install-lib ${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages)")
endif()
```

### my_pkg/CMakeList.txt
Somewhere in your main CMakeList.txt add the following to include the one above
```
add_subdirectory(src)
```

## References
Most of this is taken from

* https://bloerg.net/2012/11/10/cmake-and-distutils.html
* https://stackoverflow.com/questions/13298504/using-cmake-with-setup-py?newreg=c95d86b7b27645e4b608b29352eb2ebb



