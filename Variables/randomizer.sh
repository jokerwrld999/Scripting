#!/bin/bash

# >>>> Variables
DIR=/usr/share/dict/words
RECORDS=$(awk 'END{print NR}')
RandInRage=$(($RANDOM%$RECORDS+1))


nano /usr/share/dict/words | awk "{print $RandInRange, $0}"