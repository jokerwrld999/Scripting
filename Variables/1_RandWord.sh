#!/bin/bash

# >>>> Variables
# *** Set File Directory
DIR=/usr/share/dict/words
# *** Get Number Of Records
RECORDS=$(wc -l < $DIR)
# *** Generating Random Number In Range Of Records
RandInRage=$(($RANDOM%$RECORDS+1))

# >>>> Get Random Word From File
WORD=$(cat $DIR | sed -n "$RandInRage p")
echo "Your random word is $WORD from $DIR file"