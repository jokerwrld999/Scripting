#!/bin/bash

# >>>> Variables
DIR=/usr/share/dict/words
RECORDS=$(wc -l < $DIR)
RandInRage=$(($RANDOM%$RECORDS+1))

cat $DIR | sed -n "$RandInRage p"