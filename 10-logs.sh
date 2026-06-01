#!/bin/bash


#first argument --> what are you trying to insatll
#second argument --> exit code
 
 USERID=$(id -u)
 LOGS_DIR=/home/ec2-user/shell-logs
 LOGS_FILE="$LOGS_DIR/$0.log" # home/ec2-user/shell-logs/10-logs.sh

validate(){
    if [ $2 -ne 0 ]; then
     echo "Installing $1 is....failed"
     exit 1
  else
      echo "Installing $1 is...Success"
  fi  
}
#echo "Im continuing..."


dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
   echo "mysql is already installed.....skipping "
else
   echo "Installing MySQL"
    dnf install mysql -y  &>> $LOGS_FILE
    validate MySQL $? 
fi     


dnf list installed nginx  &>> $LOGS_FILE

if [ $? -ne 0 ]; then
   echo "nginx is already installed.....skipping "
else
   echo "Installing nginx"
    dnf install nginx -y  &>> $LOGS_FILE
    validate nginx $? 
fi     