#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14} #default 14 days


 if [ -z $SOURCE_DIR ]; then
    echo "ERROR: Missing parameters"
    echo "USAGE: $0 <source-dir> [days(optional default 14 days)] "
    exit 1

 fi   
    

     
if [ ! -d $SOURCE_DIR ]; then
    echo "Error directory $source_dir does nort exit"
    exit 1
fi


    echo "Scanning $SOURCE_DIR for log files older than 14 days"
    FILES=$(find $source_dir -name '*.log' -type f -mtime +$DAYS)

if [ -z $FILES ]

    echo "No log files older than 14 days found"
    exit 0
fi    
 
 while IFS= read -r FILE
 do 
    echo " File to be deleted $FILE "
 done <<< "$FILES"



