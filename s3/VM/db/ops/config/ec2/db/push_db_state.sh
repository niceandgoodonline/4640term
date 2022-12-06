#!/bin/bash

private_ip=$(get_private_ip)

push_ssm_value "$project/secret/db/root" "$rt_pass"
push_ssm_value "$path_db_ip" "$private_ip"
push_ssm_value "$path_db_name" "$db_name"
push_ssm_value "$path_db_port" "$db_port"
push_ssm_value "$path_app_user" "$app_user_name"
push_ssm_value "$path_app_pass" "$app_user_pass"
