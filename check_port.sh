#!/bin/bash

#检测服务端口是否up

read -p"Please input the port to check:" port

result=`netstat -atunpl|grep "$port"`

if [ ${#result} -gt 0 ];then
  echo "$port is up."
else
  echo "$port is down."
fi
