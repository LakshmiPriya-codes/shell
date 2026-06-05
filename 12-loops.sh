#!/bin/bash

 USERID=$(id -u)
 LOGS_DIR=/var/log/shell-script
 LOGS_FILE="$LOGS_DIR/$0.log" 

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root access"
    exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
     echo "Installing $1 is....failed" 
     exit 1
  else
      echo "Installing $1 is...Success" 
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
       echo "$package already installed.....Skipping"
    fi    
 done
     

