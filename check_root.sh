#!/bin/bash

#检测当前用户是否为root账户

function check_user(){
  local user_id=`id -u`
  if [ $user_id -eq 0 ];then
    echo "the current user is root."
  else
    echo "the current user is not root."
  fi
}

check_user
