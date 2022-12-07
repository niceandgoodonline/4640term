#!/bin/bash

if [ ! -d "/sysusr/frontend" ]; then mkdir "/sysusr/frontend"; fi
if [ ! -d "/sysusr/backend/app" ]; then mkdir "/sysusr/backend/app"; fi
sudo cp -r "$dev_src/frontend" "/sysusr/frontend"
sudo cp -r "$dev_src/backend" "/sysusr/backend/app"
echo "code placed."
