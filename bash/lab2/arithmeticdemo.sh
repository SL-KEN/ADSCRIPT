#!/bin/bash
#lab 2 script 2


read -p "give me 2 numbers, serperated by space: " firstnum secondnum



cat <<EOF
MATH.


$firstnum plus $secondnum equals $(( firstnum + secondnum )) 
$firstnum minus $secondnum equals $(( firstnum - secondnum ))
$firstnum divided by $secondnum equals $(( firstnum / secondnum ))
$firstnum multiplied by $secondnum equals $(( firstnum * secondnum ))


EOF 




