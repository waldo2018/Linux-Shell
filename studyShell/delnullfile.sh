#!/bin/bash

# 删除当前目录下文件大小为0的文件

for FILENAME  in `ls`
do 
	if test -d $FILENAME
	then 
		continue
	else
		if test -f $FILENAME
		then
			a=$(ls -l $FILENAME | awk '{printf $5}')
			if test $a -eq 0
			then 
				rm $FILENAME
			else 
				b=0
			fi
			
		fi		 
	fi


done

