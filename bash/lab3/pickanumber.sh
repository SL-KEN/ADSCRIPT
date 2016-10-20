#!/bin/bash
#Lab 3 Script 1 



myNumber=$((RANDOM % 10 +1)) 

guess=0 


while [ $guess -ne $myNumber ]; do

read -p "Pick a number from 1 to 10: " guess

done

if [ $guess -lt $myNumber ]; then

echo "Too small, try again"

elif [ $guess -gt $myNumber ]; then

echo "Too big, try again"



done 

echo "You got it!"
