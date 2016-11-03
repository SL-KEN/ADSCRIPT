#!/bin/bash 


counter=$



trap quit QUIT 
trap interrupt INT 

function quit {
    
    echo "quitting"
    
resetcounter=$counter    
    
}

function interrupt {
    
    echo "resetting"
    
   - resetcounter=$counter
}



read -p "What number should I start counting down from?" counter

while [ $counter -ge 0 ]; do 
    echo "$counter"

sleep 1
((counter --))
done 









  