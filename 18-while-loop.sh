#!/bin/bash

while IPS=read -r line #IFS Internal field separator
do
  echo $line 
done <01-helloworld.sh>