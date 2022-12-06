#!/bin/bash
private_ip=$(get_private_ip)

push_ssm_value "$path_app_ip" "$private_ip"
push_ssm_value "$path_app_port" "$app_port"
