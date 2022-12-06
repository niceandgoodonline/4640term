#!/bin/bash

if [ -z "$util" ]; then
  util="/staging/util"
  source "$util/app_var.sh"
  source "$util/aws_var.sh"
else

etc_file="/etc/systemd/system/tim.service"
dev_file="/staging/app/dev/config/backend/tims_app.service"

if [ "$1" == "pull" ]; then
  sudo aws s3 sync "$s3repo/$backend_subpath" "$stage/$backend_subpath"
  if [ -f $etc_file ]; then sudo rm -rf $etc_file; fi
  sudo mv "$dev_file" "$etc_file"
fi

sudo systemctl start tim || sudo systemctl restart tim
echo "app service restarted."