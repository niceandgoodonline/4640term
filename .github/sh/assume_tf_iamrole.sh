#!/bin/sh

TF_ARN="arn:aws:iam::666630334140:role/Terraform-Deployment"
TF_STS=$(aws sts assume-role --role-arn "$TF_ARN" --role-session-name "tf-github-deploy" --external-id "$TF_EXT" --duration-seconds 1200 --profile orchestration)
TF_KEY=$(echo $TF_STS | jq -r .Credentials.AccessKeyId)
TF_SEC=$(echo $TF_STS | jq -r .Credentials.SecretAccessKey)
TF_TKN=$(echo $TF_STS | jq -r .Credentials.SessionToken)

export AWS_ACCESS_KEY_ID="$TF_KEY"
export AWS_SECRET_ACCESS_KEY="$TF_SEC"
export AWS_SESSION_TOKEN="$TF_TKN"
