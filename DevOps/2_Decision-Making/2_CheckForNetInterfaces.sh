#!/bin/bash

# Find The Number Of Network Interfaces
INTERFACES=$(ip address | grep -v LOOPBACK | grep -ic mtu)

if [ $INTERFACES -gt 1 ]
then
    if [ $INTERFACES -eq 1 ]
    then
        echo "1 Active Network Interface Found"
    elif [ $INTERFACES -gt 1 ]
    then
        echo "Found Multiple Active Network Interfaces"
    fi
else
    echo "No Active Network Interfaces Found."
fi