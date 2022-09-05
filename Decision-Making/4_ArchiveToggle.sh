#!/bin/bash

# >>> Variables
BACKUPFILE=backup.tar.bz2
ISARCHIVE= echo $1 | sed -n 's/.*\(.t[ab]\)/\1/p' 


if [[ -n $1 ]] && [[ -e $1 ]] || [[ -d $1 ]]
then
    echo "Okay, let's archive $1"
    tar -cjvf $BACKUPFILE $1
    if [ $? -eq 0 ]
    then
        echo "Your $1 archived succsessfully"
    else
        echo "There was an error while archiving $1"
    fi
elif [[ -n $1 ]] && [[ $ISARCHIVE = ".tar.bzip2" ]] || [[ $ISARCHIVE = ".tar.bz2" ]] || [[ $ISARCHIVE = ".tb2" ]]
then
    echo "Oh, there is an archive let's unarchive it"
    tar -xjvf $BACKUPFILE
    if [ $? -eq 0 ]
    then
        echo "Your $BACKUPFILE unarchived succsessfully"
    else
        echo "There was an error while unarchiving $BACKUPFILE"
    fi
fi