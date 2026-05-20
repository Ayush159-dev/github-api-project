#!/bin/bash



##############


# Author: Ayush Sachdev
# Date: 07-05-2026
#
# This is for testing new learning. 
# and also showing node health.
#
#
# Version: V1
#
#
#
# ##################



set -x # debug mode
set -o # pipeline fail
set -e # stops command if it fails
set -u # catches missing variables

ps -ef | adjvnsdc

df -h


free -g

nproc

