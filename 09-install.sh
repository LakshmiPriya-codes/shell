#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
 echo "Please run this script with root access"
 exit 1
fi
#first argument --> what are you trying to insatll
#second argument --> exit code
validate(){
    if [ $2 -ne 0 ]; then
     echo "Installing $1 is....failed"
     exit 1
  else
      echo "Installing $1 is...Success"
  fi  
}
#echo "Im continuing..."


dnf list installed mysql 

if [ $? -eq 0 ]; then
   echo "mysql is already installed.....skipping "
else
   echo "Installing MySQL"
    dnf install mysql -y
    validate MySQL $? 
fi     


dnf list installed nginx 

if [ $? -ne 0 ]; then
   echo "nginx is already installed.....skipping "
else
   echo "Installing nginx"
    dnf install nginx -y
    validate nginx $? 
fi     

