#!/bin/bash


################################
# Author: Ayush Sachdev
# Date: 13 May
#
#
# Version: V1
#
# This script will report the AWS resouce usage. 
#
#
## #############################


set -e
set -x
 
# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAM USERS 


# LIST S3 BUCKET
echo "LIST OF S3 BUCKETS"
aws s3 ls > resourceTracker


# LIST EC2 INSTANCES
echo "LIST EC2 INSTANCES"
aws ec2 describe-instances | jq 'Reservations[].Instances[].InstanceId' 


# LIST AWS LAMBDA 
echo "LIST OF LAMBDA FUNCTIONS"
aws lambda list-functions >> resourceTracker


# LIST IAM USERS
echo "LIST OF IAM USERS"
aws iam list-users

