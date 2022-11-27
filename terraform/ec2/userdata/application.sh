#!/bin/bash
stage="/staging"
repo="s3://fr-4640-code-repo"
sudo mkdir $stage
sudo apt-get update
sudo apt-get install -y -q awscli nginx awscli python3 python3-pip libmysqlclient-dev
sudo aws s3 sync "$repo/app/" "$stage/app"
sudo aws s3 sync "$repo/util/" "$stage/util"
# sudo source "$stage/ops/config/ec2/app/bootstrap.sh" | tee "/tmp/setup.log"
