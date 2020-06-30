# Shell学习笔记

## 基本介绍

### Shell是什么

​	Shell是一个命令行解释器，它为用户提供一个向Linux内核发送请求以便运行程序的界面系统级程序，用户可以用Shell来启动、挂起、停止甚至是编写一些程序。

### helloworld

 - 编写一个helloworld的Shell

   ``` shell 
   hc@hc-RV411:~/Documents$ cd shell
   hc@hc-RV411:~/Documents/shell$ vim myShell.sh
   hc@hc-RV411:~/Documents/shell$ chmod 744 myShell.sh
   hc@hc-RV411:~/Documents/shell$ ./myshell.sh
   -bash: ./myshell.sh: No such file or directory
   hc@hc-RV411:~/Documents/shell$ ./myShell.sh
   hello world
   ```

 - 执行该Shell脚本

    - 给该Shell添加执行权限，执行**推荐**

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./myShell.sh
      hello world
      ```

    - 使用解释器 + Shell脚本执行

      ``` shell
      hc@hc-RV411:~/Documents/shell$ chmod u-x myShell.sh
      hc@hc-RV411:~/Documents/shell$ ls -l
      total 4
      -rw-r--r-- 1 hc hc 31  6月 27 15:00 myShell.sh
      hc@hc-RV411:~/Documents/shell$ sh ./myShell.sh
      hello world
      ```

      **第二种执行方式在编写shell的时候可以不写`#!/bin/bash`**

## Shell 变量

### Shell 变量的介绍

	- Linux Shell中的变量分为，**系统变量**和**用户自定义变量**。
	- **系统变量** ：$HOME,$JAVA_HOME,$SHELL,$USER
	- 显示当前shell中所有变量：`set`

### Shell 变量的定义

- 基本语法
  - 设置：`变量名=值` 撤销：`unset 变量名` 
  - 声明静态变量：`readonly 变量`，不能够被`unset`
- 案例
  - 定义变量A
  - 撤销变量A
  - 声明静态变量A=2不能被unset
  - 将变量提升为全局环境变量，可供其他shell程序使用。

``` shell
     1	#!/bin/bash
     2	#echo "hello world"
     3	A=100
     4	readonly B=200
     5	echo "A=${A}"
     6	echo "B=${B}"
     7	unset A
     8	unset B               #静态变量 
     9	echo "A=${A}"
    10	echo "B=${B}"          
```

执行结果

``` shell
hc@hc-RV411:~/Documents/shell$ ./myShell.sh 
A=100
B=200
./myShell.sh: line 8: unset: B: cannot unset: readonly variable  #因为是静态变量，不可以被unset
A=
B=200
```

#### 定义变量的规则

1. 变量名称可以由字母、数字、下划线组成，但是不能以数字开头。
2. 等号两侧不能够有空格。*****
3. 变量名称一般习惯大写。*****

#### 将命令的返回值赋给变量*****

1. A=`ls -la`  反引号，运行里面的命令，并把结果给变量A
2. A=$(ls -la) 等价于反引号

#### 设置环境变量

- 基本语法

  1. export 变量名=变量值
  2. source 配置文件
  3. echo $变量名

- 案例

  - 在/etc/profile中设置TOMCAT_HOME变量

  - 在环境变量中查看TOMCAT_HOME的值

  - 在另外一个shell程序中使用TOMCAT_HOME

    ``` shell
    hc@hc-RV411:~/Documents/shell$ echo $TOMCAT_HOME
    
    hc@hc-RV411:~/Documents/shell$ source /etc/profile   #该指令使配置文件生效
    hc@hc-RV411:~/Documents/shell$ echo $TOMCAT_HOME   
    /opt/apache-tomcat-7.0.104/
    hc@hc-RV411:~/Documents/shell$ vim myShell.sh 
    hc@hc-RV411:~/Documents/shell$ ./myShell.sh 
    tomcat_home=/opt/apache-tomcat-7.0.104/
    
    ```

    myshell的内容

    ``` shell
    hc@hc-RV411:~/Documents/shell$ cat -n myShell.sh 
         1	#!/bin/bash
         2	#echo "hello world"
         3	#A=100
         4	#readonly B=200
         5	#echo "A=${A}"
         6	#echo "B=${B}"
         7	#unset A
         8	#unset B
         9	#echo "A=${A}"
        10	#echo "B=${B}"
        11	:<<!                      #多行注释的开头
        12	RESULT=`ls -l`
        13	RESULT2=(ls -l)
        14	echo "${RESULT}"
        15	echo "${RESULT2}"
        16	!                         #多行注释的结尾
        17	echo "tomcat_home=${TOMCAT_HOME}"
    ```

#### 位置参数变量

 - 当我们在执行Shell脚本时，需要获取命令行的参数信息。此时就需要使用位置参数变量。

 - 基本语法

   	- `$n` ：n 为数字，`$0` 代表命令本身，`$1-$9` 代表1-9个参数，如果是10个以上的参数必须使用大括号抱起来。例如：`${10}`
      	- `$*` ：这个变量代表命令行中的所有参数，该变量把所有的参数看做一个整体。
      	- `$@`：这个变量代表命令行中的所有参数，该变量把每个参数看区分对待。
              	- `$#`：这个变量代表命令行中参数的个数

- 使用案例：

  ``` shell
  hc@hc-RV411:~/Documents/shell$ cat -n positionPara.sh 
       1	#!/bin/bash
       2	echo "$0 $1 $2"
       3	echo "$*"
       4	echo "$@"
       5	echo "$#"
  hc@hc-RV411:~/Documents/shell$ ./positionPara.sh
  ./positionPara.sh  
                                                                   #没有输入任何参数
  
  0
  hc@hc-RV411:~/Documents/shell$ ./positionPara.sh 100 200   
  ./positionPara.sh 100 200                                        #2
  100 200                                                          #3
  100 200                                                          #4
  23                                                               #5
  
  ```

  

#### 预定义变量

 - Shell设计者预先定制好的变量，可以拿来直接使用。

 - 基本语法

    - `$$` ：当前进程的进程号（PID）

    - `$!`：后台运行的最后一个进程的进程号（PID）

    - `$?` ：最后一次执行命令的返回状态。如果这个变量的值为0，则代表上一个进程正确执行；如果为非0，则证明上一个命令执行不正确。

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./preVar.sh 
      当前进程号=11465
      后台运行的最后一个进程的进程号=
      最后一次执行命令的返回状态=0
      hc@hc-RV411:~/Documents/shell$ cat -n preVar.sh 
           1	#!/bin/bash
           2	echo "当前进程号=$$"
           3	echo "后台运行的最后一个进程的进程号=$!"
           4	echo "最后一次执行命令的返回状态=$?"
      ```

      

## Shell 运算符

  - 基本介绍

     	- 学习如何在Shell中进行各种运算操作。

- 基本语法

  1. “$((运算式))” 或者 “$[运算时]”
  2. expr  m + n     注意：运算符之间要有空格
  3. expr  m  -  n
  4. expr  \*,/,%  乘，除，取余

- 应用实例

  - 计算（2+3）X4

  - 请求出命令行的两个参数[整数]的和

    ``` shell
    hc@hc-RV411:~/Documents/shell$ ./test.sh 10 20
    result1=20
    result2=20
    result3=20
    sum2=30
    hc@hc-RV411:~/Documents/shell$ cat -n test.sh
         1	#!/bin/bash
         2	#使用第一种方式 $((计算式))
         3	RESULT1=$(((2+3)*4))
         4	echo "result1=$RESULT1"
         5	
         6	#使用第二种方式 $[计算式]                   #比较推荐使用，因为简单
         7	RESULT2=$[(2+3)*4]
         8	echo "result2=$RESULT2"
         9	
        10	# 使用第三种方式 expr `m + n`
        11	SUM1=`expr 2 + 3`                       #注意：使用expr时``必须把expr也包含在内
        12	RESULT3=`expr $SUM1 \* 4`
        13	echo "result3=$RESULT3"
        14	
        15	# 求输入的两个参数的和
        16	SUM2=$[$1+$2]
        17	echo "sum2=$SUM2"
    ```

## 条件判断

- 基本语法： [ condition ] ,注意condition前后要有空格
- 非空返回true，可以使用$?验证(0为true，>1为false)

 - - 
- 按照文件权限进行判断
  - `-r` ：有读的权限
  - `-w` ：有写的权限
  - `-x` ：有执行的权限
- 按照文件类型进行判断
  - `-f `： 文件存在并且是一个常规的文件
  - `-e `：文件存在
  - `-d` ： 文件存在并且是一个目录

### test指令

 - 用于检查某个条件是否存在，它可以进行数值，字符和文件三个方面的测试

 - 数值测试

   - | 参数 | 说明           |
     | :--- | :------------- |
     | -eq  | 等于则为真     |
     | -ne  | 不等于则为真   |
     | -gt  | 大于则为真     |
     | -ge  | 大于等于则为真 |
     | -lt  | 小于则为真     |
     | -le  | 小于等于则为真 |

 - 字符串测试

    - | =         | 等于则为真               |
      | --------- | ------------------------ |
      | !=        | 不相等则为真             |
      | -z 字符串 | 字符串的长度为零则为真   |
      | -n 字符串 | 字符串的长度不为零则为真 |

 - 文件测试

   | 参数      | 说明                                 |
   | :-------- | :----------------------------------- |
   | -e 文件名 | 如果文件存在则为真                   |
   | -r 文件名 | 如果文件存在且可读则为真             |
   | -w 文件名 | 如果文件存在且可写则为真             |
   | -x 文件名 | 如果文件存在且可执行则为真           |
   | -s 文件名 | 如果文件存在且至少有一个字符则为真   |
   | -d 文件名 | 如果文件存在且为目录则为真           |
   | -f 文件名 | 如果文件存在且为普通文件则为真       |
   | -c 文件名 | 如果文件存在且为字符型特殊文件则为真 |
   | -b 文件名 | 如果文件存在且为块特殊文件则为真     |

## 流程控制

### If语句

 - 基本语法1

    - ``` shell
      if [ condition ];then
      	执行语句
      fi
      ```

   - 实例

     ``` shell
     if [ $1 -lt 50 ];then
             echo "数字小于50"
     fi
     ```

     

 - 基本语法 2（比较常用）

    - ``` shell
      if [ condition ]
      then 
      	执行语句
      fi
      ```

   - 实例

     ``` shell
     hc@hc-RV411:~/Documents/shell$ ./testIf1.sh 60
     数字大于等于50
     hc@hc-RV411:~/Documents/shell$ cat -n testIf1.sh
          1	#!/bin/bash
          2	:<<!
          3	if [ $1 -lt 50 ];then
          4		echo "数字小于50"
          5	fi
          6	!
          7	if [ $1 -lt 50 ]
          8	then
          9		echo "数小于50"
         10	elif [ $1 -ge 50 ]                   #这里增加了elif语句，这跟Java中的语句是不同的，要特别注意
         11	then
         12		echo "数字大于等于50"
         13	fi
     ```

     

### Case语句

 - 基本语句

    - ``` shell
      case 变量值 in
      "值1")
      执行语句
      ;;
      "值2")
      执行语句
      ;;
      *)
      执行语句
      ;;
      esac
      ```

    - 实例

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./testCase.sh 1
      the num is 1
      hc@hc-RV411:~/Documents/shell$ ./testCase.sh 2
      the num is 2
      hc@hc-RV411:~/Documents/shell$ ./testCase.sh 3
      the num is other
      hc@hc-RV411:~/Documents/shell$ cat -n testCase.sh
           1	#~/bin/bash
           2	case $1 in
           3	"1")
           4		echo "the num is 1"
           5	;;
           6	"2")
           7		echo "the num is 2"
           8	;;
           9	*)
          10		echo "the num is other"
          11	;;
          12	esac
          13	
      ```

### For语句

 - 基本语句1

    - ``` shell
      for 变量值 in 值1 值2 值3
      do
      执行语句
      done
      ```

    - 案例

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./testFor.sh 10 20 30
      the num is 10 20 30
      ======================
      the num is 10
      the num is 20
      the num is 30
      hc@hc-RV411:~/Documents/shell$ cat -n testFor.sh
           1	#!/bin/bash
           2	#for循环的第一种方式
           3	for i in "$*"                                   
           4	do
           5		echo "the num is $i"
           6	done
           7	
           8	echo "======================"
           9	
          10	for j in "$@"
          11	do 
          12		echo "the num is $j"
          13	done
      
      ```

      <u>注意：$* 和 $@ 在使用的时候如果不加引号的话，两者是没有区别的，但是如果加上引号，就有区别了。加上引号的情况下，前者会把所有参数作为一个整体，后者会分开区别对待</u>

 - 基本语句2

    - ``` shell
      for((初始值;循环控制条件;变量变化))
      do
      执行语句
      done
      ```

    - 案例

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./testFor2.sh
      sum=5050
      hc@hc-RV411:~/Documents/shell$ cat -n testFor2.sh
           1	#!/bin/bash
           2	SUM=0
           3	for ((i=0;i<=100;i++))
           4	do 
           5		SUM=$[$SUM+$i]
           6	done
           7	echo "sum=$SUM"
      ```

      

### While语句

 - 基本语句

    - ``` shell
      while [ condition ]
      do 
      	执行语句
      done
      ```

    - 案例

      ``` shell
      hc@hc-RV411:~/Documents/shell$ ./testWhile.sh 100
      sum=4950
      hc@hc-RV411:~/Documents/shell$ ./testWhile.sh 50
      sum=1225
      hc@hc-RV411:~/Documents/shell$ cat -n testWhile.sh 
           1	#!/bin/bash
           2	
           3	SUM=0
           4	I=0
           5	
           6	while [ $I -lt $1 ]
           7	do
           8		SUM=$[$SUM+$I]
           9		I=$[$I+1]
          10	done
          11	
          12	echo "sum=$SUM"
      ```

### Read读取

 - 基本语法

    - `read [选项] 参数 `
      	- `-p` 指定读取值时候的提示符 
      	- `-t` 指定读取值时等待的时间（秒），如果没有输入，超过时间就不在等待。
      	- 参数：变量：指定读取值得变量值

- 实例

  ``` shell
  hc@hc-RV411:~/Documents/shell$ ./testRead.sh
  请输入一个整数100
  sum=4950
  hc@hc-RV411:~/Documents/shell$ cat -n testRead.sh
       1	#!/bin/bash
       2	
       3	read -p "请输入一个整数" NUM
       4	
       5	SUM=0
       6	
       7	for ((i=0;i<$NUM;i++))
       8	do
       9		SUM=$[$SUM+$i]
      10	done
      11	
      12	echo "sum=$SUM"
  ```

## 函数

### 系统函数

 - basename：返回完整路径最后的部分，常用语获取文件名

    - basename [pathname] [suffix]

   - basename [string] [suffix]

   - basename命令会删掉所有的前缀包括最后一个/

   - 选项：suffix为后缀，如果suffix被指定了，basename会将pathname或string中的suffix去掉

     ``` shell
     hc@hc-RV411:~/Documents/shell$ basename /home/hc/Documents/Shell/testRead.sh
     testRead.sh
     hc@hc-RV411:~/Documents/shell$ basename /home/hc/Documents/Shell/testRead.sh .sh
     testRead
     hc@hc-RV411:~/Documents/shell$ basename /home/hc/Documents/Shell/testRead.sh Read.sh
     test
     ```

- dirname：返回完整路径最后/的前面的部分，常用于返回路径部分

  - dirname 文件绝对路径：从给定的包含绝对路径的文件名中出去文件名（非目录部分），然后返回剩下的路径（目录部分）

    ``` shell
    hc@hc-RV411:~/Documents/shell$ dirname /home/hc/Documents/Shell/testRead.sh 
    /home/hc/Documents/Shell
    ```

### 用户自定义函数

 - 基本语法

    - ``` shell
      function 函数名()
      {
      	action;
      	[return int;]
      }
      ```

    - 调用函数的时候直接用函数名：function，后面直接跟函数

      ``` bash
      hc@hc-RV411:~/Documents/shell$ ./testFunction.sh
      请输入第一个数12
      请输入第二个数13
      12 13
      25
      hc@hc-RV411:~/Documents/shell$ cat -n testFunction.sh
           1	#!/bin/bash
           2	
           3	read -t 10 -p "请输入第一个数" NUM1
           4	read -t 10 -p "请输入第二个数" NUM2
           5	
           6	
           7	function getSum()
           8	{
           9		echo $NUM1 $NUM2
          10		return $[$NUM1+$NUM2]
          11	
          12	}
          13	
          14	getSum $NUM1 $NUM2
          15	
          16	echo $? 
      ```

      注意：

      1.  在调用函数的时候需要在调用的位置之前声明函数。
      2.  函数返回值，只能通过$? 系统变量获得，直接通过=,获得是空值。其实，我们按照上面一条理解，知道函数是一个命令，在shell获得命令返回值，都需要通过$?获得。

## Shell输出输入重定向

 - 基本介绍

    - ​	大多数Unix 系统命令从你的终端接受输入并所产生的输入发送回您的终端。一个命令通常从一个叫做标准输入的地方读取输入，默认情况下，这恰好是你的终端，同样，一个命令通常将其输出写入到标出输出，默认情况下，这恰好也是你的终端。

    - | 命令            | 说明                                               |
      | :-------------- | :------------------------------------------------- |
      | command > file  | 将输出重定向到 file。                              |
      | command < file  | 将输入重定向到 file。                              |
      | command >> file | 将输出以追加的方式重定向到 file。                  |
      | n > file        | 将文件描述符为 n 的文件重定向到 file。             |
      | n >> file       | 将文件描述符为 n 的文件以追加的方式重定向到 file。 |
      | n >& m          | 将输出文件 m 和 n 合并。                           |
      | n <& m          | 将输入文件 m 和 n 合并。                           |
      | << tag          | 将开始标记 tag 和结束标记 tag 之间的内容作为输入。 |

## Shell综合编程实例

- 需求分析

  1. 每天凌晨2：10备份数据库atguiguDB到/data/backup/db
  2. 备份开始和备份结束能够给出相应的提示信息
  3. 备份后的文件要求以备份时间为文件名，并打包成.tar.gz的形式，比如：2018-03-12_230201.tar.gz
  4. 在备份的同时，检查是否有10天前备份的数据库文件，如果有就将其删除。

- 如果报错：mysqldump: command not found

  解决方案：

  1. 先找到mysqldump的位置：find / -name mysqldump -print
  2. 然后建立一个链接：ln -fs /usr/local/mysql/bin/mysql /usr/bin

- crontab -e

- 10 2 * * * /usr/sbin/mysql_backup_db.sh

  
  
## Shell 常用命令

### awk指令

 - 基本用法

 - ``` bash
   ls -l filename | awx '{printf $n}'  # 将用空格符或tab键分开的数据的第n项单独打印出来
   ```

### sleep

- 可以将目前动作延迟一段时间

- ```bash
  sleep [--help] [--version] number[smhd]
  ```

  - --help : 显示辅助讯息
  - --version : 显示版本编号
  - number : 时间长度，后面可接 s、m、h 或 d
  - 其中 s 为秒，m 为 分钟，h 为小时，d 为日数

### ping

 - [详细说明](https://www.runoob.com/linux/linux-comm-ping.html)

   