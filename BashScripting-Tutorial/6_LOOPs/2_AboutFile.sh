#!/bin/bash

dir=$1
file_names=$(ls -lh $dir | awk '{print $9}')

if [ -f $dir  ]
then
    echo "Give me a dirictory, please"
elif [ -d $dir ]
then
    echo "Let's check what in it" 
    for entry in $file_names
    do
        full_path="$dir/$entry"
        

        if [ -d $full_path ]
        then
            amount_of_entries=$(ls -lh $full_path | wc -l)
            let "amount_of_files = $amount_of_entries - 1"
            echo "The $entry directory consists of $amount_of_files entries"
        elif [ -f $full_path ]
        then
            file_size=$(ls -lh $dir | grep "$entry" |awk '{print $5}')
            echo "The $entry file is $file_size KB in size"
        else 
            echo "Unknown File"
        fi
    done 
else
    echo "Idk what type of file is this"
fi
