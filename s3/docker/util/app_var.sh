#!/bin/bash

stage="/staging"
working="$stage/docker/app/ops/config/ec2"
dev_cnf="$stage/docker/app/dev/config"
dev_src="$stage/docker/app/dev/code"

backend_home="/sysusr/backend"

# Other useful path variables
source ./aws_var.sh
source ./ssm_path.sh

dependency_ssm_ip_path="$path_db_ip"
dependency_ssm_port_path="$path_db_port"
dependency_ec2_tag_key="Service"
dependency_ec2_tag_value="DB"
