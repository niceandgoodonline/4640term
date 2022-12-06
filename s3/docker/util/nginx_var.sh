#!/bin/bash

stage="/tmp/staging"
working="$stage/docker/frontend/ops/config/ec2"
dev_cnf="$stage/docker/frontend/dev/config"
dev_src="$stage/docker/frontend/dev/code"

frontend_home="/sysusr/frontend"

# Other useful path variables
source ./aws_var.sh
source ./ssm_path.sh

dependency_ssm_ip_path="$path_app_ip"
dependency_ssm_port_path="$path_app_port"
dependency_ec2_tag_key="Service"
dependency_ec2_tag_value="APP"
