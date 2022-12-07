#!/bin/bash
stage="/tmp/staging"
repo="s3://fr-4640-code-repo/VM"
sudo mkdir $stage
sudo apt-get update
sudo apt-get install -y -q awscli nginx python3 python3-pip libmysqlclient-dev
sudo aws s3 sync "$repo/app/" "$stage/app"
sudo aws s3 sync "$repo/util/" "$stage/util"
sudo source "$stage/app/ops/config/ec2/bootstrap.sh" 2>&1 > "/tmp/setup.log"
