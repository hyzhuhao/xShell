#!/bin/bash

#获取当前时间
function getDateTime(){
  local time=`date +"%Y-%m-%d %H:%M:%S"`
  echo $time
  }

  time=$(getDateTime)
  echo "当前时间为:"$time
