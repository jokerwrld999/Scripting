#!/bin/bash

# >>>> Global Variables
# *** Filename Argument
FILE=$1
# *** Date In Format Year-Month-Day
DATE=$(date +%Y-%m-%d)
# *** Delimiter Type
DELIMITER="_"

# >>> Set Filename With Date First
BACKUPNAME=$DATE$DELIMITER$FILE

# >>>> Set Another Filename Format
# *** Get Name Of The File
FILENAME=$(basename $FILE | cut -d\. -f1)
# *** Get Extention Of The File
EXTENTION=$(basename $FILE | sed -E 's|(.[^.]*){1}||')

# *** Set Full Name Of The File
NAMEOFBACKUP=$FILENAME$DELIMITER$DATE$EXTENTION

# >>>> Backup With New Filename
cp $1 $BACKUPNAME
cp $1 $NAMEOFBACKUP

# >>>> Feature To Reanme A List Of Files
# *** Get All Arguments
FILES=$@

# >>>> Renaming A Bunch Of Files
basename -s .txt -a $FILES | xargs -n1 -i cp {}.txt $DATE$DELIMITER{}.txt 
