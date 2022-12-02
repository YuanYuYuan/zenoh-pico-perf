#!/usr/bin/env bash

root_dir=$(git rev-parse --show-toplevel)
source $root_dir/scripts/set-env.sh
echo $LD_LIBRARY_PATH
src_dir=$(dirname $(realpath ${BASH_SOURCE[0]}))
target_dir=$src_dir/../target
mkdir -p $target_dir

for prog in $src_dir/*.c; do
    prog_name=$(basename $prog)
    gcc -O3 -Wall \
        -DZENOH_LINUX $prog -lzenohpico \
        -o $target_dir/${prog_name%.*}
done
