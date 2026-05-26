#!/bin/bash

# TIMESTAMP=$(date)

# echo "Time is:$TIMESTAMP"

START-TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL-TIME=$(($END_TIME-$START-TIME))

echo "script executed in $TOTAL_TIME seconds"
