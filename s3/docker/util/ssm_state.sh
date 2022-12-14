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
  sudo -e echo $_x | passwd "$1"
  push_ssm_value "$2" $_x
  _x=""
}

get_private_ip()
{
  TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600"`
  curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4
}

compare_ec2_age_to_ssm_parameter_age()
{
  aws ec2 describe-instances --filters Name=tag:$dependency_ec2_tag_key,Values=$dependency_ec2_tag_value > ec2_file
  ec2_launch_time=$(jq '.Reservations | .[].Instances | .[].LaunchTime' file)
  ec2_private_ip=$(jq '.Reservations | .[].Instances | .[].PrivateIpAddress' file)
  ec2_public_ip=$(jq '.Reservations | .[].Instances | .[].PublicIpAddress' file)
  ssm_ip_time=$(aws ssm get-parameter-history --name "$dependency_ssm_ip_path" | jq '.Parameters | .[].LastModifiedDate' | tail -n 1)
  echo "TODO"
}
