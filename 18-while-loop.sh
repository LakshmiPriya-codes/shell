#!/bin/bash

while IPS=read -r line #IFS Internal field separator
do
  echo "$line"
done   <02-conversations.sh