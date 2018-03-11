#!/bin/bash

#获取当前时间
function getDateTime(){
  local time=`date +"%Y-%m-%d %H:%M:%S"`
  echo $time
  }

#计算2个数之间的所有数总和，比如从1+...+100
function getSum(){
  if [ $# -ne 2 ];then
    echo "param num error."
	exit -1
  fi
  start=$1
  end=$2
  if [ $start -gt $end ];then
    echo "the first num should not less than the second num."
	exit -1
  fi
  sum=0
  for((i=$start;i<=$end;i++))
  do
    sum=$(($sum+i))
  done
  echo $sum
}


time=$(getDateTime)
echo "当前时间为:"$time

sum=$(getSum 1 10)
echo "1+2+...+10="$sum
