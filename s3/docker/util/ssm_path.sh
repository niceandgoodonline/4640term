#!/bin/bash

# SSM Root path
project="/fr-4640-term"

# Frontend/nginx SSM path
nginx_path="$project/state/docker/nginx"
path_nginx_ip="$nginx_path/ip"

# App SSM path
app_path="$project/state/docker/app"
path_app_ip="$app_path/ip"
path_app_port="$app_path/port"

# DB SSM Parameter Store paths
db_path="$project/state/docker/db"
path_db_ip="$db_path/ip"
path_db_name="$db_path/db-name"
path_db_port="$db_path/db-port"
path_app_user="$db_path/app-db-user"
path_app_pass="$db_path/app-db-pass"

echo "loaded SSM Paths"
