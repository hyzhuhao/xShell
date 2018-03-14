#!/bin/bash

#批量创建或删除用户

#参数1为需要创建的用户名文件
if [ ! -f "$1" ];then
  echo "$1 not exists!"
  exit 1
fi

read -p "flag:" flag

users=`cat $1`
for user in $users
do
  if [ "$flag" = "add" ];then
    useradd -m $user
	echo "add the user $user successfully!"
	echo $user | passwd --stdin $user
	echo "set the user $user password successfully!"
  elif [ "$flag" = "del" ];then
    echo "the $user will be deleted!"
	userdel -r $user
  else
    echo "error command!"
  fi
done
