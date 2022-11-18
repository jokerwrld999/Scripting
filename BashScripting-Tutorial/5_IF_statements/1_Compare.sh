#!/bin/bash

echo -ne "
==========================================================
            Hi! Let's compare two numbers
==========================================================
"
if [ $1 -gt $2 ]
then
    echo "The First Number Is Larger"
else
    echo "The Second Number Is Larger"
fi