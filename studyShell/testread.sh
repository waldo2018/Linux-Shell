#!/bin/bash

# 打印读取的内容，为下面的例子做准备

:<<!
while read name
do
	echo $name

done < 0.sh
!

# 读取a.c中的内容，并对该内容进行加1处理

test -e a.c

while read line
do 
	a=$[$line + 1]

done < a.c

echo "$a"
