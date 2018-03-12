#!/bin/bash

#不登录mysql直接执行sql语句

host=127.0.0.1
user=root
password=123456
port=3306
dbname=test

sql_conn="-h${host} -P${port} -u${user} -p${password} $dbname"

#执行sql语句，并将结果输出到文件中
#参数1：待执行的sql语句
#参数2：保存结果的文件
function exec_sql(){
  sql=$1
  outfile=$2
  mysql $sql_conn -e "${sql}" > $outfile
}

exec_sql "select * from user" out.txt
