#!/bin/bash

BACKUPFILE=backup.tar.bz2

echo "Here we go $USER, let's just make a backup of your data on $HOSTNAME."
echo "--------------------------"

echo "You've passed $# arguments as such $@"
echo "--------------------------"

echo "Start Backuping $1"
echo "--------------------------"
tar -cjvf $BACKUPFILE $1
echo "--------------------------"
echo "Backup was finished with code $?"
echo "--------------------------"

echo "Moving Backup to $2"
echo "--------------------------"
mv $BACKUPFILE $2
echo "--------------------------"
echo "Moving file was finished with code $?"
echo "--------------------------"

echo "Let's check if file exists"
echo "--------------------------"
ls -la $2 | grep $BACKUPFILE
echo "--------------------------"

echo "We made it here in $SECONDS seconds"