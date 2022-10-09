#!/bin/bash

day=$(date +%d)
nextDay=$(( expr $day++ ))
echo "date +$nextDay-%m-%y"