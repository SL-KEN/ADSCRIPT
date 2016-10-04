#!/bin/bash
#lab 2 script 5




interfacenames=('ifconfig |grep '^[a-zA-Z]' |awk '{print $1}'' )
echo "Interfaces names found  $(interfacenames[0])"
