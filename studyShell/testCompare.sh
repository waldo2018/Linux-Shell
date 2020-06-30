#!/bin/bash

read -p "请输入第一个数字：" NUM1
read -p "请输入第二个数字：" NUM2

# 第一种实现方式
:<<!
if [ $NUM1 -eq $NUM2 ]
then 
	echo "两个数相等"
elif [ $NUM1 -lt $NUM2 ]
then
	echo "第一个数字小于第二个数字"
else
	echo "第一个数字大于第二个数字"

fi
!

# 第二种实现方式

if test $NUM1 -eq $NUM2
then
	echo "两个数字相等"
elif test $NUM1 -lt $NUM2
then 
	echo "第一个数字小于第二个数字"
else 
	echo "第一个数字大于第二个数字"
fi


