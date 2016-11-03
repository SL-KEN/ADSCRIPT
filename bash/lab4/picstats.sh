#!/bin/bash

directory=~/Pictures
filestoshow=3

#Functions 

function usage {
    
cat <<EOF 

    Usage: $0 [-h|--help] [-c|--count noOfFilesToDisplay] [directoryToWorkOn]
    Count defaults to 3, Directory defaults to ~/Pictures

EOF

}

function error-message {
    echo "$@" >&2
}

#some command stuff here 

gotadirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) 
        usage
        exit 0
        ;;
    -c | --count ) 
        if [[ $2 =~ ^[1-7][0-7]*$ ]]; then
            filestoshow=$2
            shift
        else
            usage
            error-message "number required during count"
            exit 1
        fi
        ;;
    * ) 
    
        if [ $gotadirectory = "no" ]; then
            directory=$1
            gotadirectory="yes"
    
        else
            usage
            error-message "'$1' is not understood  as a directory, I already have a directory $directory"
            exit 1
        fi
        ;;
    esac
    shift
done

### from original Picstat Script 

echo -n "In the ~/Pictures directory, number of files are "
find $directory -type f |wc -l

echo -n "Those files use "
du -sh $directory |awk '{print $1}'

cat <<EOF 

The $filestoshow largest files are:
========================

EOF

du -h $directory/* |sort -h |tail -$filestoshow