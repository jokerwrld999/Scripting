#!/bin/bash

if [ -z $1]
then
    echo "You haven't passed any arguments, please gimme some arguments"
else
    if [ -n $1 ]
    then
        echo "Wow, great you've passed some arguments, let's check what is it then"
    elif [ -d $1 ]
    then
        echo "Well, this $1 is exists and is a directory."
    elif [ -r $1 ]
        echo "So, this $1 is a file and I can read it if you want to"
    else
        echo "Sorry, but what did you give to me? I don't now what is it."
        echo "Can you give me a file or a directory, please"
    fi
fi    

    