#!/bin/bash
#File:str.sh
#Author:zhuhao
#CreateTime:2018-3-18 17:51
#Version:v1.0
#Description:shell字符串的基本操作

str="hello world!"
#1.获取字符串长度
echo ${#str}
echo $str|awk '{print length($0)}'

#2.字符串截取，第一采用分片，第二采用awk的substr方法
echo ${str:1:3}
echo $str|awk '{print substr($0,1,3)}'

#3.字符串包含，第一采用grep，第二采用A=~B方式
echo $str | grep "worl"
if [ $? -ne 0 ];then
  echo "not exists."
else
  echo "exists."
fi

if [ $str =~ "worl" ];then
  echo "exists."
else
  echo "not exists."
fi

#4.字符串替换，${string/substring/replacement}格式
echo ${str/"worl"/"aaaa"}

#5.字符串连接
echo $str"aaa"

#6.字符串查找，利用awk index函数,返回位置从1开始
echo $str|awk '{print index($0,"worl")}'

#7.字符串删除
#7.1利用#和##删除，其中${str#substring正则表达式},从字符串开头查找到第一个匹配到的substring正则，并删除匹配上的表达式
#${str##substring正则表达式}，从字符串开头查找到最后一个匹配到的substring正则，并删除匹配上之前的字符
test="http://www.test.com/123.html"
echo ${test#*//} #结果为www.test.com/123.htm
echo ${test##*/} #结果为123.html


#7.2利用%和%%删除，其中${str%substring正则表达式},从字符串末尾查找到第一个匹配到的substring正则，并删除匹配上的字符
#${str%%substring正则表达式}，从字符串末尾开始查找到最后一个匹配到的substring正则，并删除匹配上之前的字符
echo ${test%/*} #结果为http://www.test.com
echo ${test%%/*} #结果为http:

