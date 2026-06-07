#!/bin/bash

 USERID=$(id -u)
 LOGS_DIR=/var/log/shell-script
 LOGS_FILE="$LOGS_DIR/$0.log" 
 TIME-STAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root access"
    exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
     echo TIME-STAMP [Error] "Installing $1 is....failed" | tee -a $LOGS_FILE
     exit 1
  else
      echo TIME-STAMP [Info] "Installing $1 is...Success" | tee -a $LOGS_FILE
  fi  
}

#echo "Im continuing..."

 for package in $@
 do 
     echo "Insatlling $package"
     dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then 
     dnf install $package -y &>> $LOGS_FILE
     validate "Installing $package" $?
     else
       echo TIME-STAMP [Info] "$package already installed.....Skipping"
    fi    
 done
     

