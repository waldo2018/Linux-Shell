#!/bin/bash


# 创建文件夹，如果输入文件夹存在，则继续输入直到创建成功

while :
do
	echo "请输入文件夹名称："
	read FILENAME
	if test -e /home/hc/studyShell/$FILENAME
	then
		echo "该文件夹已经存在，请重新输入"
	else 
		mkdir $FILENAME
		echo "文件夹创建成功"
		break
	fi
		
done
