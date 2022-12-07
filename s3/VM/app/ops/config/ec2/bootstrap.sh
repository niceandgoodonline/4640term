#!/bin/bash
util="$stage/util"
source "$util/app_var.sh"

# Helper Functions
source "$util/ssm_state.sh"
# Remove/Create Users
source "$util/user_management.sh"
source "$working/seed_user.sh" "frontend" "$app_path"
source "$working/seed_user.sh" "backend" "$app_path"

# Setup Nginx
source "$working/nginx.sh"

# Get backend python packages
source "$working/backend_packages.sh"

# Move source to proper destination
source "$working/place_code.sh"
echo "sleeping 5 minutes..."
sleep 300

# Pull DB State from cloud
source "$working/pull_db_state.sh"
