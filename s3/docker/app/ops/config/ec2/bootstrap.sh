#!/bin/bash
util="$stage/util"
source "$util/app_var.sh"

# Helper Functions
source "$util/ssm_state.sh"

# Get backend python packages
source "$working/backend_packages.sh"

# Move source to proper destination
echo "sleeping 5 minutes..."
sleep 300

# Pull DB State from cloud
source "$working/pull_db_state.sh"

source "$working/push_app_state.sh"
