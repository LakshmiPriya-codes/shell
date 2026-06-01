#!/bin/bash

NUM1=10
NUM2=linux

SUM=$(($NUM1+$NUM2))

echo "sum is: $SUM"

#Array
MOVIES=("RRR" "Varanasi" "Pushpa") #index always starts from 0
echo "Movies are: ${MOVIES[@]}"
echo "Frist Movie is: ${MOVIES[0]}"
echo "second Movie is: ${MOVIES[1]}"
echo "Third Movie is: ${MOVIES[2]}"