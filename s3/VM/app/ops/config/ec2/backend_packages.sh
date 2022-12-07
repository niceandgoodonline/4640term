#!/bin/bash

sudo pip3 install --user -r "$backend_home/app/requirements.txt"
sudo mv /root/.local "$backend_home"
sudo echo "export PATH=$PATH:$backend_home/.local/bin" >> $backend_home/.bashrc
echo "backend python packages installed."
