#!/bin/bash

USERID= $(id -u)

if[ $USERID -ne o ]; then 
 echo "Please run this script with root access"
fi

echo "Im continuing..."