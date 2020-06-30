#!/bin/bash

echo -n "login:"
read name
echo -n "password:"
read passwd

if [ $name = "tom" -a $passwd = "123" ] 
then
	echo "$name , $passwd"
	echo "你已经成功登录"

else
	echo "$name , $passwd"
	echo "用户名或密码错误"

fi
