#!/bin/bash

#shell数组的基本使用

#shell数组分为(1)普通数组，下标为数字;(2)关联数组，下标为字符串，类似于map

#1.数组定义,元素之间以空格分割
arr_num=(1 2 3 4 5)
arr_str=("abcd" "hello" "world")

#2.获取数组长度
len=${#arr_num[@]}
echo "数组arr_num长度为:$len"

#3.数组遍历
for item in ${arr_str[@]}
#获取使用for item in ${arr_str[*]}
do
  echo $item
done

#4.数组分片访问
echo ${arr_num[*]:1:3}

#5.读取，设置下标的值,下标从0开始

echo ${arr_num[1]}

arr_num[10]=10
for item in ${arr_num[@]}
do
  echo $item
done

#6.删除数组元素，删除数组
unset arr_str[2]
unset arr_str
