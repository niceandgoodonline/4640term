#!/bin/bash

sudo cp "$dev_cnf/init.sql" "$working/init.sql"

rt_pass=$(generate_password 32)
app_user_pass=$(generate_password 32)
app_user_name="backend"
db_name="term"

sed -i "s|ROOT_MYSQL_PASS|$rt_pass|g" "$working/init.sql"
sed -i "s|DB_NAME|$db_name|g" "$working/init.sql"
sed -i "s|APP_DB_USER|$app_user_name|g" "$working/init.sql"
sed -i "s|APP_DB_PASS|$app_user_pass|g" "$working/init.sql"

push_ssm_value "$project/secret/db/root" "$rt_pass"
push_ssm_value "$path_db_name" "$db_name"
push_ssm_value "$path_db_port" "$db_port"
push_ssm_value "$path_app_user" "$app_user_name"
push_ssm_value "$path_app_pass" "$app_user_pass"
