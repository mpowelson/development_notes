# Install Clang and GCC

## Install
These scripts are used to install Clang and GCC on Ubuntu 18.04. They were modified from https://gist.github.com/bhaskarvk/78a80d9b5d308c84ba43b4a4e599a439

First setup Clang
```
sudo bash llvm-clang-alternatives.sh
```

Next setup GCC
```
sudo bash gcc-alternatives.sh
```

Next setup switch between GCC and Clang
```
sudo bash cc-alternatives
```

Note: If you run into errors like `x can't be slave of y: it is a master alternative` then you can remove it using `sudo update-alternatives --remove-all x`. Before you do that you probably want to check and make sure it doesn't have more than one alternative. You can do that by trying to switch it like normal `sudo update-alternatives --config x`.

## Usage
Switch between Clang and GCC with 
```
sudo update-alternatives --config cc
```

Switch between gcc versions with
```
sudo update-alternatives --config gcc
```

## Notes (have not been updated)

This approach uses [update-alternatives](https://linux.die.net/man/8/update-alternatives) to manage GCC and LLVM/CLANG C/C++ compiler toolchains.
Although tested on Linux Mint 18.3, this approach should work on any Debian based distro or for that matter any Linux distro with `update-alternatives` support, provided the packages are installed correctly.

There are 3 files

* `gcc-alternatives.sh` installs GCC versions 5/6/7 and sets up alternatives for `gcc`/`g++`/`cpp`/`gfortran`.
* `llvm-clang-alternatives.sh` installs LLVM and CLANG versions 4/5 and sets up alternatives for various LLVM and CLANG programs including `clang` and `clang++`.
* `cc-alternatives.sh` sets up alternatives for the `cc`, `cxx`, and the `ld` commands. This script can be used to change systemwide default compiler/linker combination to either GCC or CLANG.

Once these scripts are run you can change the system GCC/CLANG versions by running `sudo update-alternatives --config gcc|clang`. To change the default compiler/linker combo used by the system do `sudo update-alternatives --config cc`.

**NOTE:** Both the `gcc` and the `clang` compilers use the `libstdc++`, the [C++ standards library](https://gcc.gnu.org/onlinedocs/libstdc++/) which is the default on Linux. There are ways to build `libc++`, which is an LLVM provided [alternative](https://libcxx.llvm.org/) to `libstdc++` and use that instead, but there are hardly any advantages to doing that, so I haven't included notes for that here.
