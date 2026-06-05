#!/bin/bash

 USERID=$(id -u)
 LOGS_DIR=/home/ec2-user/shell-logs
 LOGS_FILE="$LOGS_DIR/$0.log" # home/ec2-user/shell-logs/10-logs.sh


if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root access"
    exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
     echo "Installing $1 is....failed" | tee -a $LOGS_FILE
     exit 1
  else
      echo "Installing $1 is...Success" | tee -a $LOGS_FILE
  fi  
}

#echo "Im continuing..."

 for package in $@ 
 do 
     echo "Insatlling $package"
 done
    