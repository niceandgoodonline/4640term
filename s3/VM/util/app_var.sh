#!/bin/bash

stage="/tmp/staging"
working="$stage/app/ops/config/ec2"
dev_cnf="$stage/app/dev/config"
dev_src="$stage/app/dev/code"

frontend_home="/sysusr/frontend"
backend_home="/sysusr/backend"

# Other useful path variables
source $util/aws_var.sh
source $util./ssm_path.sh
