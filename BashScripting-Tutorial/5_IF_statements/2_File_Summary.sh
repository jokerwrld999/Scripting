#!/bin/bash

params=$*

for param in $params
do
    #check file parameters
    file_name=$(basename $param)
    root_path=$(echo "$param" | sed "s|$file_name||")
    root_list=$(ls -lh $root_path)
    root_size=$(echo "$root_list" | grep "$file_name" | awk '{print $5}')
    dir_list=$(ls -lh $param)
    caps_name=$(echo $file_name | awk '{ print toupper($0) }')

    if [ -d $param ] && [ $root_size != 0 ]
    then
        echo
        echo "################## INFO ABOUT A DIRICTORY ##################"
        echo -ne "
        ------------        The $param Dirictory Exists  ------------
        ------------ Listing Of The Dirictory $caps_name  ------------
        "
        echo "$dir_list"
    elif [ -d $param ] && [ $root_size = 0 ]
    then
        echo
        echo "################## INFO ABOUT A DIRICTORY ##################"
        echo -ne "
        ------------ The Dirictory $caps_name Is Empty ------------
        "
    elif [ -e $param ] && [ $root_size != 0 ]
    then
        echo
        echo "################## INFO ABOUT A FILE ##################"
        echo "The $param file is exitsts and $root_size KB in size"
    elif [ -e $param ] && [ $root_size = 0 ]
    then
        echo
        echo "################## INFO ABOUT A FILE ##################"
        echo -ne "
        ------------ The File $caps_name Is Empty ------------
        "
    else
        echo
        echo "################## ##################"
        echo "I don/'t know what kind of file is $param"
    fi 
done