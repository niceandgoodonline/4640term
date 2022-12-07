#!/bin/bash

# SSM Root path
project="/fr-4640-term"

# SSM App path
app_path="$project/state/ec2/app"

# DB SSM Parameter Store paths
db_path="$project/state/ec2/db"
path_db_ip="$db_path/ip"
path_db_name="$db_path/db-name"
path_db_port="$db_path/db-port"
path_app_user="$db_path/app-db-user"
path_app_pass="$db_path/app-db-pass"

echo "loaded SSM Paths"
