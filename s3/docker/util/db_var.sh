#!/bin/bash

stage="/tmp/staging"
working="$stage/db/ops/config/ec2/db"
dev_cnf="$stage/db/dev/config/"

# Other useful path variables
source ./aws_var.sh
source ./ssm_path.sh
