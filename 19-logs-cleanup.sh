#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14} #default 14 days


 if [ -z $SOURCE_DIR ]; then
    echo "ERROR: Missing parameters"
    echo "USAGE: $0 <source-dir> [days(optional default 14 days)] "
    exit 1

 fi   
    

     

