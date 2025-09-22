#!/bin/bash

dir_name_from_path() {
    dir=$(echo $1 | sed 's/\ /\\ /g')
    dir="${dir%*/}"
    dir="${dir##*/}"

    echo $dir
}

find_dir_under_root() {
    local root=$1
    local search=$2

    for dir_path in $root/*; do 
        dir_name=$(dir_name_from_path "$dir_path")
        if [[ "$dir_name" == "$search" ]]; then
            echo $dir_name
        fi
    done
}

echo $TEST
echo $HOME

if [[ "1" == "${TEST}" ]]; then
    echo Here
    echo $(find_dir_under_root $HOME "devenv")
fi
#testpath="x/s/f/g/h/"
#echo $(dir_name_from_path $testpath)

#testpath="x/s/f/g/h-k/"
#echo $(dir_name_from_path $testpath)

#testpath="x/s/f/g/h k/"
#echo $(dir_name_from_path "$testpath")
