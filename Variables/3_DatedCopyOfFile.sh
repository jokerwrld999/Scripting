#!/bin/bash

# >>>> Variabels
# *** Filename Argument
FILE=$1
# *** Date In Format Year-Month-Day
DATE=$(date +%Y-%m-%d)
# *** Delimiter Type
DELIMITER="_"
# *** New Filename
FILENAME=$DATE$DELIMITER$FILE

# >>>> Backup With New Filename
cp $1 $FILENAME
