#!/bin/bash
util="$1/util"
source "$util/db_var.sh"
source "$util/ssm_state.sh"
source "$working/prepare_init_sql.sh"
sudo mysql -u root < "$working/init.sql"
source "$working/push_state_to_cloud.sh"
