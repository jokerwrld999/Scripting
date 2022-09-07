#!/bin/bash

# >>> Variables
BACKUPFILE=backup.tbz
ISARCHIVE=$(echo $1 | sed -n 's/.*\(.t[ab]\)/\1/p') 


if [ -z $1 ]
then
    echo "There's no any arguments, please gimme something"
else
    echo "The arguments accepted, thanks"
    if [[ -n $1 ]] && [[ $ISARCHIVE == ".tbz" ]] || [[ $ISARCHIVE == ".tar.bz2" ]] || [[ $ISARCHIVE == ".tb2" ]]; 
    then
        echo "Oh, there is an archive, let's unarchive it"
        tar -xjf $1
        if [ $? = 0 ]
        then
            echo "Your $BACKUPFILE unarchived succsessfully"
        else
            echo "There was an error while unarchiving $BACKUPFILE"
        fi
    elif [[ -n $1 ]] && [[ -e $1 ]] || [[ -d $1 ]]
    then
        echo "Okay, let's archive $1"
        tar -cjf $BACKUPFILE $1
        if [ $? = 0 ]
        then
            echo "Your $1 archived succsessfully"
        else
            echo "There was an error while archiving $1"
        fi
    fi
fi