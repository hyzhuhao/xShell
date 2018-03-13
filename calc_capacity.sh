#!/bin/bash

#计算指定目录下指定文件格式的文件大小

user_dir="/home/zhuhao/"
file_type="*.gz"

for file in `find ${user_dir} -name "${file_type}"`
do
  du -h $file
done

#查找所有以.sh和.txt格式结尾的文件
#方式一：
find . -name "*.sh" -o -name "*.txt"

#方式二：
find . -regex ".*\(\.sh\|\.txt\)"

#查找所有不以.sh结尾的文件
find . ! -name "*.sh"
