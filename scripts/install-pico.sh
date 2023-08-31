#!/usr/bin/env bash

root_dir=$(git rev-parse --show-toplevel)
install_dir=$root_dir/install
mkdir -p $install_dir
cd $install_dir
mkdir -p src

git -C ./src/zenoh-pico pull 2> /dev/null || git clone https://github.com/yuanyuyuan/zenoh-pico -b test/old-protocol ./src/zenoh-pico

cd ./src/zenoh-pico
INSTALL_PREFIX=$root_dir/install make
make install
