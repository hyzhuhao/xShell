#!/bin/bash

#自动生成shell脚本的文件头注释信息

#如果没有接任何参数
if [ ! "$1" ];then
  echo "please input a argument as the fileName!"
  exit 1
fi

#如果文件存在
if [ -f $1 ];then
  vim "$1"
  exit 1
fi

#创建文件
touch "$1"

#注释信息
echo "#!/bin/bash" >> "$1"
echo "#filename:$1" >> "$1"
echo "#Description:" >> "$1"
echo "#Author:$USER" >> "$1"
echo "#Version:1.0" >> "$1"
now=`date +"%Y-%m-%d %H:%M:%S"`
echo "#CreateTime:$now" >> "$1"
vim "$1"
