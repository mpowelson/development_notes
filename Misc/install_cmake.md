# Install Latest CMake version from apt

See https://apt.kitware.com/


# Install Older version

1) Get the version you want from github: https://github.com/Kitware/CMake/releases

2) Extract tar.gz or run .sh file

3) Export the path to the file similar to below. I added this to my ~/.bashrc file
```
export PATH=$HOME/workspaces/externalSoftware/cmake-3.8.2-Linux-x86_64/bin:$PATH
export CMAKE_PREFIX_PATH=$HOME/workspaces/externalSoftware/cmake-3.8.2-Linux-x86_64:$CMAKE_PREFIX_PATH
```
