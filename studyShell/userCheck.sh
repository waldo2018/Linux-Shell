#!/bin/bash

# 查看是否为当前用户
echo "请输入当前用于的名称："
read NAME
USER=$(whoami)

if test $NAME = $USER 
then
	echo "当前用户正是您所输入用户"

else 
	echo "当前用户并非您所输入用户"

fi

