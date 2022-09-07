#!/bin/bash

echo "Here is a third line of the $1:"
echo ===============================
echo 

cat /dev/stdin | sed -n "3 p"