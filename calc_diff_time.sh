#!/bin/bash

#计算2个时间相差的秒数

time1=`date -d "2018-3-12 09:00:00" +%s`
time2=`date -d "2018-3-12 10:00:00" +%s`

result=$((time2-time1))
echo $result
