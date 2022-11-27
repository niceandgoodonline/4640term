#!/bin/bash

# stage="/staging"
stage="/home/o/school/sch/4640/4640term/terraform/s3"
working="$stage/db/ops/config/ec2/db"
dev_cnf="$stage/db/dev/config/"

# Other useful path variables
source ./aws_var.sh
source ./ssm_path.sh
