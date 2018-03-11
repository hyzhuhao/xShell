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

#获取文件的函数
function getFilelines(){
  local lines=0
  if [ -f $1 ];then
    lines=`wc -l $1|awk '{print $1}'`
  else
    echo "the file $1 is not exists."
  fi
  echo $lines
}

#清空文件内容
function clearFile(){
  if [ -f $1 ];then
    lines=$(getFilelines $1)
	if [ $lines -gt 0]; then
	  cat /dev/null > $1
	fi
  else
    echo "the file $1 is not exists."
  fi
}

#合并2个文件
function mergeFile(){
  if [ $# -ne 2 ];then
    echo "this function need 2 files."
	exit -1
  fi
  if [ ! -f $1 -o ! -f $2 ]; then
    echo "the 2 param should be 2 files."
	exit -1
  fi
  lines=$(getFilelines $1)
  if [ $lines -gt 0 ];then
    cat $1 >> $2
  fi
}

获取字符串长度
function getStrLength(){
  local str=$1
  echo ${#str}
}

#利用awk获取字符串长度
function getLength(){
  result=`echo $1|awk '{print length($1)}'`
  echo $result
}

#判断是否为闰年
function isLeapYear(){
  local result=`echo $1|awk '{print ($1%4==0 && $1%100!=0 || $1%400==0)}'`
  echo $result
}

##根据年，月，日，获取其对应的总天数
#参数1：年
#参数2：月
#参数3：日
#返回值，天数
function getDays(){
  local total=0
  leap=$(isLeapYear $1)
  case $2 in
  1)  total=$3 ;;
  2)  total=$((31+$3)) ;;
  3)  total=$((31+28+$3)) ;;
  4)  total=$((31+28+31+$3)) ;;
  5)  total=$((31+28+31+30+$3)) ;;
  6)  total=$((31+28+31+30+31+$3)) ;;
  7)  total=$((31+28+31+30+31+30+$3)) ;;
  8)  total=$((31+28+31+30+31+30+31+$3)) ;;
  9)  total=$((31+28+31+30+31+30+31+31+$3)) ;;
  10) total=$((31+28+31+30+31+30+31+31+30+$3)) ;;
  11) total=$((31+28+31+30+31+30+31+31+30+31+$3)) ;;
  12) total=$((31+28+31+30+31+30+31+31+30+31+30+$3)) ;;
  esac
  if [ $leap -eq 1 ];then
    total=$((total+1))
  fi
  echo $total
}

#字符串填充
#字符串
#需要得到的字符串长度，不够用0填充
#返回填充后的字符串
function fillStr(){
  local result=$1
  strLen=$(getLength $1)
  if [ $strLen -ge $2 ]; then
     echo $result
  else
     fillLen=$(($2-$strLen))
	 while [ $fillLen -gt 0 ]
	 do
	  result="0"$result
	  fillLen=$(($fillLen-1))
	 done
  fi
  echo $result 
}

time=$(getDateTime)
echo "当前时间为:"$time

sum=$(getSum 1 10)
echo "1+2+...+10="$sum

lines=$(getFilelines "common.sh")
echo $lines

strlen=$(getLength hello)
echo $strlen

leapYear=$(isLeapYear 1996)
echo $leapYear

totalDays=$(getDays 1989 2 7)
echo $totalDays

result=$(fillStr hello 8)
echo $result
