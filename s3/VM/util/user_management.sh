#!/bin/bash

remove_user()
{
  echo "Removing user: $user"
  if [ -d /sysusr/$user ]; then
    echo "delete /sysusr/$user"
    sudo rm -rf /sysusr/$user
  fi

  if [ -d /home/$user ]; then
    echo "delete /home/$user"
    sudo rm -rf /home/$user
  fi
  sudo usermod -G $user
  sudo userdel $user
}


create_user()
{
  sudo useradd -m -d "/sysusr/$user"
  push_user_password "$user" $1
}


create_sysusr()
{
  if [ -d /sysusr ]; then
    echo "/sysusr directly already exists."
  else
    sudo mkdir /sysusr;
  fi
}


set_permissions()
{
  user="$1"
  permissions="$2"
  sudo chown -R $user:$user /sysusr/$user
  sudo chmod -R "$2" /sysusr/$user
}
