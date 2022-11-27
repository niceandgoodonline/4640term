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
