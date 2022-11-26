#!/bin/sh

aws configure set region us-west-2 --profile orchestration
aws configure set aws_access_key_id $AWS_KEY --profile orchestration
aws configure set aws_secret_access_key $AWS_SEC --profile orchestration
