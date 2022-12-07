#!/bin/bash

get_ssm_value()
{
  aws ssm get-parameter --region $aws_region --name $1 | jq -r .Parameter.Value
}

push_ssm_value()
{
  aws ssm put-parameter --region $aws_region --name $1 --value $2 --type "String" --overwrite
}

generate_password()
{
  echo $(LC_ALL=C tr -dc 'A-Za-z' </dev/urandom | head -c 4)$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c $(($1 - 4)) )
}

push_user_password()
{
  _x=$(generate_password 128)
  _user=$1
  _ssm_path=$2
  sudo chpasswd <<< "$_user:$_x"
  push_ssm_value "$_ssm_path" $_x
  _x=""
}

get_private_ip()
{
  TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600"`
  curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4
}
