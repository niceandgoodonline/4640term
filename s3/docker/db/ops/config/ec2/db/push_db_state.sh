#!/bin/bash

get_private_ip()
{
  TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600"`
  curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4
}

private_ip=$(get_private_ip)

push_ssm_value "$project/secret/db/root" "$rt_pass"
push_ssm_value "$path_db_ip" "$private_ip"
push_ssm_value "$path_db_name" "$db_name"
push_ssm_value "$path_db_port" "$db_port"
push_ssm_value "$path_app_user" "$app_user_name"
push_ssm_value "$path_app_pass" "$app_user_pass"
