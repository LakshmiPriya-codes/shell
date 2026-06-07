 #!/bin/bash
 
 set -e
 USERID=$(id -u)
 LOGS_DIR=/var/log/shell-script
 LOGS_FILE="$LOGS_DIR/$0.log" 
 TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with root access"
    exit 1
fi

#echo "Im continuing..."

 for package in $@
 do 
     echo "$TIMES-TAMP [Info] Insatlling $package"
     dnf list installed $package &>> $LOGS_FILE

    if [ $? -ne 0 ]; then 
     dnf install $package -y &>> $LOGS_FILE
     else
         echo -e "$TIMESTAMP  [Info] $package already installed..... $Y Skipping $N"
    fi    
 done