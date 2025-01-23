#!/bin/bash

# List all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text)

# Iterate through each region and list instances
for region in $regions; do
    echo "Region: $region"
    aws ec2 describe-instances --region $region --query "Reservations[*].Instances[*].[InstanceId, InstanceType, State.Name, PublicIpAddress]" --output table
done
