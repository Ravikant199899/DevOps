#!/bin/bash

#############################
#Author: Ravikant Jadhav
#
# Date: 1/6/2025
#
# Purpose: Exam Result
#
# Version: 1.3
#############################

set -x #Debug mode
set -e #Exit from script when error occurs
set -o pipefail

echo -e "Enter your Math Subject marks: \c"
read -r m

echo -e "Enter your Physics Subject marks: \c"
read -r p

echo -e "Enter your Chemistry Subject marks: \c"
read -r c

echo -e "Enter your Biology Subject marks: \c"
read -r b

if [ $m -ge 35 -a $p -ge 35 -a $c -ge 35 -a $b -ge 35 ]; then
    total=$(echo "$m + $p + $c + $b" | bc)
    avg=$(echo "$total / 4" | bc)

    echo "Total Marks = $total"
    echo "Average Marks = $avg"

    if [ $avg -ge 75 ]; then
        echo "Congrats you got Distinction"

    elif [ $avg -ge 60 -a $avg -lt 75 ]; then
        echo "Congrats you got First Class"

    elif [ $avg -ge 50 -a $avg -lt 60 ]; then
        echo "You got Second Class"

    elif [ $avg -ge 35 -a $avg -lt 50 ]; then
        echo "You got Third Class"

    fi
else
    echo "Sorry you Failed"
fi

