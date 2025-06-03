#!/bin/bash


############################
# Author: Ravikant Jadhav
# Date: 2/6/2025
# Purpose: This script will report AWS resource usage
############################

set -x
set -e
set -o pipefail

# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAM USERS

AWS_REGION="us-east-1"

echo "AWS RESOURCE TRACKER"

echo "S3 BUCKETS"
aws s3 ls

echo "EC2 INSTANCES"
aws ec2 describe-instances --region $AWS_REGION --query "Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,State:State.Name,AZ:Placement.AvailabilityZone}" --output table


echo "LAMBDA FUNCTIONS"
aws lambda list-functions --region $AWS_REGION --query "Functions[*].{Name:FunctionName,Runtime:Runtime,LastModified:LastModified}" --output table

echo "IAM USERS"
aws iam list-users --query "Users[*].{UserName:UserName,CreatedAt:CreateDate}" --output table


echo "END OF REPORT"
