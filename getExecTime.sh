#!/bin/bash
#File:getExecTime.sh
#Author:zhuhao
#CreateTime:2018-3-18 17:16
#Version:V1.0
#Description:计算脚本执行时间

#计算程序脚本执行时间，单位为s级
#返回脚本执行时间
function calcTimeSeconds(){
  read -p "please input the file to execute:" fname
  if [ ! -f $fname ];then
    echo "the file $fname is not exists."
	return 1
  fi
  #%s为秒
  local begin_time=$(date +"%s")
  sh $fname
  local end_time=$(date +"%s")
  local cost_time=$((end_time-begin_time))
  echo cost_time
}

#计算脚本执行时间，单位ms
#返回脚本执行时间
function calcTimeMS(){
  read -p "please input the file to execute:" fname
  if [ ! -f $fname ];then
     echo "the file $fname is not exists."
     return 1
 fi
 #%s为秒，%N为纳秒
 local begin_time=$(date +"%s.%N")
 sh $fname
 local end_time=$(date +"%s.%N")

 local start_s=$(echo $begin_time|cut -d'.' -f1)
 local start_ns=$(echo $begin_time|cut -d'.' -f2)
 local end_s=$(echo $end_time|cut -d'.' -f1)
 local end_ns=$(echo $end_time|cut -d'.' -f2)

 local cost_time=$((end_s-start_s+(end_ns-start_ns)/1000000))
 echo $cost_time
}
