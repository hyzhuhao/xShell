#!/bin/bash

#获取linux系统的基础配置

#获取cpu逻辑处理器个数
function get_cpu_processors(){
  local cpu_processor=`cat /proc/cpuinfo|grep "processor"|wc -l`
  echo $cpu_processor
}

#获取cpu的物理个数
function get_cpu_nums(){
  local result=`cat /proc/cpuinfo|grep "physical id"|sort|uniq|wc -l`
  echo $result
}

#获取系统物理内存大小，单位为G
function get_mem_total(){
  local mem_total=`cat /proc/meminfo|grep "MemTotal"|awk '{print $2/1024/1024}'`
  echo $mem_total
}

function get_disk_total(){
  local disk_total=`df -m|awk 'BEGIN{sum=0} NR>1{sum+=$2} END{print sum/1024}'`
  echo $disk_total
}
