#!/bin/bash

# 查找hc用户的目录下是否存在该文件

echo "请输入文件名称"
read FILENAME

if test -e /home/hc/$FILENAME
then
	echo "该文件存在"

else 
	echo "改文件不存在"

fi
