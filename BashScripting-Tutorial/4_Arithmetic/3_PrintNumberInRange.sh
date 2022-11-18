#!/bin/bash

echo -ne "
========================================================================
Hi! This script can give you any "RANDOM" number in your given range
========================================================================
"
read -p "Please, enter the lower limit: " lower_limit
read -p "Please, enter the upper limit: " upper_limit

random_numer=$(shuf -i $lower_limit-$upper_limit -n 1)
echo "Here your random namber is - " $random_numer