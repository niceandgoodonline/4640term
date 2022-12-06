#!/bin/bash
stage="/staging"
repo="s3://fr-4640-code-repo/docker"
sudo mkdir $stage
sudo aws s3 sync "$repo/app/" "$stage/app"
sudo aws s3 sync "$repo/util/" "$stage/util"
sudo source "$stage/ops/config/ec2/app/bootstrap.sh" | tee "/tmp/setup.log"
