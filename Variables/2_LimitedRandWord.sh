#!/bin/bash

# >>>> Variables
# *** The Char Length Argument
CHARLENGTH=$1
# *** Set File Directory
DIR=/usr/share/dict/words
# *** Get Number Of Records
RECORDS=$(wc -l < $DIR)
# *** Generating Random Number In Range Of Records
RandInRage=$(($RANDOM%$RECORDS+1))

# >>>> Get Random Word From File
LIMITWORD=$(grep -E "^.{$CHARLENGTH}$" $DIR | sed -n "$RandInRage p")
echo "Your random word is $LIMITWORD from $DIR file"