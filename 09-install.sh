#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
 echo "Please run this script with root access"
 exit 1
fi


#echo "Im continuing..."

echo "Installing MySQL"
dnf install Mysql -y

if [ $? -ne 0 ]; then
  echo "Installing MySQl is....failed"
  exit 1

else
   echo "Installing MySQL is...Success"

fi     
