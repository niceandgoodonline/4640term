#!/bin/bash

if [ -z "$util" ]; then
  util="/tmp/staging/util"
  source "$util/app_var.sh"
  source "$util/aws_var.sh"
fi

# NGINX variables
nginx_sites_path="/etc/nginx/sites-enabled/default"
nginx_sub_path="app/dev/config/nginx"

if [ "$1" == "pull" ]; then
  sudo aws s3 sync "$s3repo/$nginx_sub_path" "$stage/$nginx_sub_path"
  sudo rm -rf "$nginx_sites_path"
  sudo mv "$stage/$nginx_sub_path" "$nginx_sites_path"
fi

sudo systemctl start nginx || sudo systemctl restart nginx
echo "nginx service re/started."
