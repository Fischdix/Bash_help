#!/bin/bash

for f in *.rpm; do
        if [ -f "$f" ] # does file exist?
        then
                dir=$(echo "$f" | awk -F '[-.]' '{print $1}') # extract first E## from filename
                if [ "$dir" ] # check if string found
                then
                        mkdir -p "$dir"  # create dir
                        mv "$f" "$dir"     # move file into new dir
                else
                        echo "INCORRECT FILE FORMAT: \""$f"\"" # print error if file format is unexpected
                fi
        fi
done