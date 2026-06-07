 
 #!/bin/bash
 
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

validate(){
    if [ $2 -ne 0 ]; then
     echo  -e "$TIMESTAMP [Error] Installing $1 is.... $R failed $N" | tee -a $LOGS_FILE
     exit 1
  else
      echo -e "$TIMESTAMP [Info] Installing $1 is...$G Success $N" | tee -a $LOGS_FILE
  fi  
}

#echo "Im continuing..."

 for package in $@
 do 
     echo "$TIMES-TAMP [Info] Insatlling $package"
     dnf list installed $package &>> $LOGS_FILE

    if [ $? -ne 0 ]; then 
     dnf install $package -y &>> $LOGS_FILE
     validate "Installing $package" $?
     else
         echo  "$TIMESTAMP  [Info] $package already installed..... $Y Skipping $N"
    fi    
 done