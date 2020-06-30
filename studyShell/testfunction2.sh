#!/bin/bash

# 给函数传递参数

function p_num()
{
	num="$1"
	echo $num

}

for i in $@
do 
	p_num $i

done 

