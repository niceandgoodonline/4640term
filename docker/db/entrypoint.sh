#!/bin/bash
stage="/tmp/staging"
repo="s3://fr-4640-code-repo/docker"
sudo mkdir $stage
sudo aws s3 sync "$repo/db/" "$stage/db"
sudo aws s3 sync "$repo/util/" "$stage/util"
sudo source "$stage/ops/config/ec2/db/bootstrap.sh" | tee "/tmp/setup.log"
