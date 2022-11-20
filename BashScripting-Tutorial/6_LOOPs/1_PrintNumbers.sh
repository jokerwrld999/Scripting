#!/bin/bash

for num in {0..20}
do
    if [[ $(($num%2)) -eq 0 ]]
    then
        type_num="Even"
    else
        type_num="Odd"
    fi
    echo $num $type_num
done