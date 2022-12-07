#!/bin/bash

if [ -z "$util" ]; then
  util="/tmp/staging/util"
  source "$util/app_var.sh"
  source "$util/aws_var.sh"
else

if [ -f "$working/backend.conf" ]; then sudo rm "$working/backend.conf"; fi
cp "$dev_cnf/backend.conf.tpl" "$working/backend.conf"

db_ip=$(get_ssm_value $path_db_ip)
db_name=$(get_ssm_value $path_db_name)
db_port=$(get_ssm_value $path_db_port)
app_user=$(get_ssm_value $path_app_user)
app_pass=$(get_ssm_value $path_app_pass)

sudo sed -i "s|DB_PRIV_IP|$db_ip|g" "$working/backend.conf"
sudo sed -i "s|DB_PORT|$db_port|g" "$working/backend.conf"
sudo sed -i "s|DB_NAME|$db_name|g" "$working/backend.conf"
sudo sed -i "s|APP_DB_USER|$app_user|g" "$working/backend.conf"
sudo sed -i "s|APP_DB_PASS|$app_pass|g" "$working/backend.conf"

if [ -f "$backend_home/app/backend.conf" ]; then sudo rm "$backend_home/app/backend.conf"; fi
mv "$working/backend.conf" "$backend_home/app/backend.conf"
echo "backend.conf synced to infrastructure."
