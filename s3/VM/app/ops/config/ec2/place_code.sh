#!/bin/bash

if [ ! -d "/sysusr/frontend/app" ]; then mkdir "/sysusr/frontend/app"; fi
if [ ! -d "/sysusr/backend/app" ]; then mkdir "/sysusr/backend/app"; fi
sudo cp -r "$dev_src/frontend" "/sysusr/frontend/app"
sudo cp -r "$dev_src/backend" "/sysusr/backend/app"
echo "code placed."
