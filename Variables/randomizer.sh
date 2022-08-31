#!/bin/bash

# >>>> Variables
DIR=/usr/share/dict/words
RECORDS=$(wc -l < $DIR)
echo $RECORDS
RandInRage=$(($RANDOM%$RECORDS+1))
echo $RandInRage

cat $DIR | sed -n "$RandInRage p"