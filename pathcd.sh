#!/bin/bash

#$1 flavour
#$2 language
#$3 project

TO="$HOME"

for fDir in $TO/*; do    # list directories in the form "$TO/dirname/"
    fDir=${fDir%*/}      # remove the trailing "/"
    fDir="${fDir##*/}"    # print everything after the final "/"
    if [[ "$fDir" == "$1" ]]; then   
        TO="${TO}/${fDir}"
        for lanDir in $TO/*; do
            lanDir="${lanDir%*/}"
            lanDir="${lanDir##*/}" 
            if [[ "$lanDir" == "$2" ]]; then
                TO="${TO}/${lanDir}"
                break
            fi
        done
        break
    fi
done

echo "$TO" 

