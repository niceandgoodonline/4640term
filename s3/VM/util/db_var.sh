#!/bin/bash

stage="/tmp/staging"
util="$stage/util"
working="$stage/db/ops/config/ec2/db"
dev_cnf="$stage/db/dev/config"

# Other useful path variables
source $util/aws_var.sh
source $util/ssm_path.sh
