#!/bin/bash

read -p "Enter a number: " NUM 
echo
echo "You have entered $NUM"

if [$NUM -gt 100]
then
    echo "We entered in IF block"
    sleep 5
    echo "Your Number is grater than 100"
    echo
    date
fi

echo "Out of IF block"
echo "Script execution completed successfully."