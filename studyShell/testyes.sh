#!/bin/bash

# yes或者no返回不同的结构
echo "请输入[ y/n ]"
read a
case $a in
	y|Y|Yes|YES)
		echo "你输入的是：YES"
	;;
	n|N|NO|no)
		echo "你输入的是：NO"
	;;
	*)
		echo "输入错误！"
esac
