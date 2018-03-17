#!/bin/bash
#File:delayExecute.sh
#Author:zhuhao
#CreateTime:2018-3-18 17:21
#Version:v1.0
#Description:延时执行脚本

read -p "please input the file to execute: " fname
read -p "please input the seconds to delay execute the scripts: " time

if [ ! -f $fname ];then
  echo "the $fname is not exists."
  exit 1
fi

count=0
while true
do
  if [ $count -lt $time ];then
    let count++
	sleep 1
	echo -n -e "$count"
  else
    sh $fname
	echo "finish execute the file $fname"
	exit 0
  fi
done
