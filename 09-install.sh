#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
 echo "Please run this script with root access"
 exit 1
fi


#echo "Im continuing..."


dnf installed myfggfhsql -y

if [ $? -ne 0 ]; then
   echo "mysql is already installed.....skipping "
else
   echo "Installing MySQL"
    dnf install myfggfhsql -y

  if [ $? -ne 0 ]; then
     echo "Installing MySQl is....failed"
     exit 1
  else
      echo "Installing MySQL is...Success"
  fi  
fi     
