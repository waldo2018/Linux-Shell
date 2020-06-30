#!/bin/bash

# 如果test.log文件大于0，则将/opt/*.tar.gz 移动到当前目录下

a=0

while name="test.log"
do
	sleep 1
	b=$(ls -l $name | awk '{printf $5}')
	if test $b -gt $a
	then cp /opt/*.tar.gz /home/hc/studyShell/
	exit 0
	fi

done

