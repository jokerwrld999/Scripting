#!/bin/bash

FILE=$1
DATE=$(date +%Y-%m-%d)

FILENAME="$DATE_$FILE"
cp $1 $FILENAME
