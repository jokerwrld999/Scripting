#!/bin/bash

read -p "Enter a number: " NUM 
echo
echo "You have entered $NUM"

if [ $NUM -gt 100 ] 
then
    echo "We entered in IF block"
    sleep 5
    echo "Your Number is grater than 100"
    echo
    date
else
    echo "You've enterd number less than 100."
fi

echo "Out of IF block"
echo "Script execution completed successfully."