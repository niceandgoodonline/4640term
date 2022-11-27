#!/bin/bash

if [ -z "$util" ]; then
  util="/staging/util"
  source "$util/user_management.sh"
else

if [ -z $1 ]; then echo "no user passed. type username:";
  read user
  if [ -z $user ]; then echo "no user passed. exiting."; exit 1; fi
else
  user=$1
fi

if [ -z $2 ]; then echo "no ssm path passed. type ssm path:";
  read ssm_path
  if [ -z $user ]; then echo "no ssm path passed. exiting."; exit 1; fi
else
  ssm_path=$2
fi

create_sysusr
if [ -n "$(id $user | grep "$user")" ]; then remove_user; fi
if [ -z "$(id $user | grep "$user")" ]; then create_user "$ssm_path/$user/passwd"; fi
echo "blank slate for $user created."