# Profiling Compile Times
## Setup

1) Make sure you have at least clang 9 with `clang --version`
2) Build ClangBuildAnalyzer
```
git clone https://github.com/aras-p/ClangBuildAnalyzer
cd ClangBuildAnalyzer
make -f projects/make/Makefile
```

## In Catkin workspace

Build using clang telling it to generate the necessary files

```
catkin build --cmake-args -DCMAKE_CXX_FLAGS="-ftime-trace" -DCMAKE_CXX_COMPILER="/usr/bin/clang++" -DCMAKE_BUILD_TYPE=RelWithDebInfo
```

Create an "artifacts folder" for the analyzer
```
mkdir artifacts_folder
```

Then run the build analyzer on the build directory

```
./ClangBuildAnalyzer --all ~/code/tesseract/build/ capture_file
```

Analyze capture file

```
./ClangBuildAnalyzer --analyze capture_file
```
