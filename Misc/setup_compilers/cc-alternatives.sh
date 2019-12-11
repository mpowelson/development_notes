#!/usr/bin/env sh

# Remove all existing alternatives
sudo update-alternatives --remove-all cc
# Uncomment to fix error: "alternative c++ can't be slave of cc: it is a master alternative"
# sudo update-alternatives --remove-all c++

# exit on first error
set -e

sudo update-alternatives \
      --install /usr/bin/cc   cc   /usr/bin/gcc     30 \
      --slave   /usr/bin/c++ c++ /usr/bin/g++  \
      --slave   /usr/bin/ld ld /usr/bin/x86_64-linux-gnu-ld

sudo update-alternatives \
      --install /usr/bin/cc   cc   /usr/bin/clang     20 \
      --slave   /usr/bin/c++ c++ /usr/bin/clang++  \
      --slave   /usr/bin/ld ld /usr/bin/lld
