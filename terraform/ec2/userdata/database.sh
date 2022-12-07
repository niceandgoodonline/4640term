#!/bin/bash
stage="/tmp/staging"
repo="s3://fr-4640-code-repo/VM"
mkdir $stage
apt-get update
apt-get install -y -q awscli mysql-server python3 python3-pip
aws s3 sync "$repo/db/" "$stage/db"
aws s3 sync "$repo/util/" "$stage/util"
source "$stage/db/ops/config/ec2/bootstrap.sh"
