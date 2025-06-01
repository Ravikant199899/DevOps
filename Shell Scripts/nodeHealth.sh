#!/bin/bash



##############################
#
#
#  Author: Ravikant Jadhav
#
#  Date: 23/5/2025
#
#  Version: v1
#
#
#############################

set -x #Debug mode
set -e #exit the script when there is an error
set -o pipefail


df -h

free -g

nproc

ps -ef | grep "amaazon" | awk -F" " '{print $2}'
