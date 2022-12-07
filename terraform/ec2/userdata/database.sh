#!/bin/bash
stage="/tmp/staging"
repo="s3://fr-4640-code-repo/VM"
sudo mkdir $stage
sudo apt-get update
sudo apt-get install -y -q awscli mysql-server python3 python3-pip
sudo aws s3 sync "$repo/db/" "$stage/db"
sudo aws s3 sync "$repo/util/" "$stage/util"
sudo source "$stage/db/ops/config/ec2/bootstrap.sh"
