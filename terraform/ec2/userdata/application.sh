#!/bin/bash
stage="/tmp/staging"
repo="s3://fr-4640-code-repo/VM"
mkdir $stage
apt-get update
apt-get install -y -q awscli nginx jq python3 python3-pip libmysqlclient-dev
aws s3 sync "$repo/app/" "$stage/app"
aws s3 sync "$repo/util/" "$stage/util"
source "$stage/app/ops/config/ec2/bootstrap.sh"
