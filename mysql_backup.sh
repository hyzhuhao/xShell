#!/bin/bash
#File:mysql_backup.sh
#Author:zhuhao
#CreateTime:2018-3-18 17:36
#Version:v1.0
#Description:实现mysql数据库的备份

#备份目录
BACKUP_DIR="/home/zhuhao"

#备份文件名称，采用当天日期命名
DATE=$(date +"%Y%m%d")

#mysql用户名
USERNAME=“root”
#mysql密码
PASSWORD=”123456“
#mysql数据库
DATABASE=“test”

#待备份的文件
FILE=$BACKUP_DIR/$DATEBASE-$DATE.sql

#文件存在在删除，不存在则创建
if [ ! -f $FILE ];then
  touch $FILE
else
  rm -rf $FILE
fi

#备份数据库
mysqldump -u $USERNAME -p $PASSWORD $DATABASE > $FILE

#统计备份目录下备份的文件数,按日期的顺序进行排序，选项t
count=`ls -lrt $BACKUP_DIR/*.sql|wc -l`
echo $count






