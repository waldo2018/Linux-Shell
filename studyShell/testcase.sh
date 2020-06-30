#!/bin/bash

# case 语句练习

echo "请输入一个数字 在1-10 之间："
read NUM
case $NUM in
"1")
	echo "这个数字是：$NUM"
;;
"2")
	echo "这个数字是：$NUM"
;;
"3")
	echo "这个数字是：$NUM"
;;
*)
	echo "输入错误"
;;
esac
