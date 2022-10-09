#!/bin/bash

day=$(date %d)
nextDay=$(( $day++ ))
echo "date +$nextDay-%m-%y"