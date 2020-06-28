# Linux 学习笔记

## 基本介绍

略

## 文件系统目录结构
### Linux目录特点
- Linux的目录中只有一个主目录
- Linux是以文件的形式管理设备，一切皆为文件

### 树形结构

  - `/bin`：是Binary的缩写，这个目录中存放着经常使用的目录。

  - `/sbin`：s是Super user的缩写，这里存放着系统管理员使用的管理程序。

  - `/home`：存放普通用户的主目录，在Linux中每个用户都有一个自己的目录，一般该目录名是以帐号命名的。

  - `/root`：该目录为系统管理员，也称为超级权限者的用户主目录。

  - `/lib`：系统开机所需要最基本的动态链接共享库，其作用类似与windows中的`dll`文件。几乎所有的应用程序都需要用到这些共享库。

  - `/lost+found`：这个目录一般情况下是空的，当系统非法关机后，这里存放一些文件。

  - `/etc`：所有的系统管理所需要的配置文件和子目录。

  - `/usr`：非常重要的目录，用户的很多应用程序和文件都存放在这一目录下，类似与windows的program files目录。

  - `/boot`：存放启动Linux需要的一些核心文件，包括一些连接文件和镜像文件。

  - `/proc`：这个目录是一个虚拟的目录。它是系统内存的映射，访问这个目录来获取系统信息。

  - `/srv`：service的缩写，该目录存放一些服务启动之后需要提供的数据。

  - `/sys`：linux2.6内核的一个很大的变化，该目录下安装了2.6内核中新出现的一个文件系统`sysfs`。（ubuntu20.04中没有）

  - `/tmp`：这个目录是用来存放一些临时文件的

  - `/dev`：类似有windows的设备管理器，把所有的硬件用文件的形式存储。

  - `/media`：linux系统会自动设别一些设备，例如U盘光驱等等，当识别后，Linux会把识别的设备挂载到这个目录下。

  - `/mnt`：系统提供该目录是为了让用户临时挂在别的文件系统的，我们可以将外部的存储挂载到`/mnt/`上，然后就可以进入该目录查看里面的内容。

  - `/opt`：这是给主机额外的安装软件所摆放的目录，如ORACLE数据库就放在此文件中，默认为空。

  - `/usr/local`：这里另一个给主机额外安装软件所设置的目录，一般通过编译源码的方式安装的程序。

  - `/var`：存放着不断扩充着的东西，习惯经常被修改的目录放在这个目录中，包括各种日志文件。

  - `/selinux`：是一种安全子系统，它能控制程序只能访问特定文件。 

    -------------

    

## 远程登录和文件传输

- 远程登录：Xshell  （网络基础知识需要补充）
  - Centos7 远程登录不成功解决方案
    - [Centos7设置静态IP](https://blog.csdn.net/weiyongle1996/article/details/75050738)
    - [Centos7防火墙启用](https://blog.csdn.net/gaokcl/article/details/82908844) 
- 远程文件传输：Xftp

## 编辑工具

- vi 和vim 编辑器 vim是vi的增强版
- 三种常用模式

  ### 正常模式
    - 在正常模式下，我们可以使用快捷键。
  ### 插入模式
    - 在模式下，程序员可以输入内容。
  ### 命令行模式
    - 在模式下，可以提供相关指令，完成保存，替换，离开vim，显示行号等
  ### 快捷键的使用（小案例）
  - 拷贝当前行__yy__ ，拷贝当前向下的5行 5yy ，并粘贴（__P__）（正常模式）

  - 删除当前行__dd__， 删除当前行向下的5行 5dd （正常模式）

  - 查找一个单词，在命令行下，输入单词，回车就开始查找，输入小n查找下一个。（命令行模式 正常模式）

    - *所有查找的单词需要在命令行下输入*，*输入单词是需要使用/进入*
    - *查找下一个n，在正常模式下输入*

  - 设置文件的行号，在命令行下，输入`set nu` 和 `set nonu`（命令行模式）

  - 去到文件的最后一行__G__，开头的位置__gg__（正常模式）

  - 在文件中输入一个“hello”，但是不想要，想要撤销，在正常模式中输入小u（正常模式）

  - 将光标移动到某一行。(*在最新版的vim中命令行输入行号，回车可以直接跳到该行行首*)
    - *显示行号码：set nu*
    - *输入20这个数*
    - ~~*输入shift + g*~~  回车
    
  - 更多的快捷键查看vim快捷键文档。

    ----

##  开机、重启和用户登录注销

 - 关机&重启命令

    - 基本介绍

       - shutdown -h now：表示立即关机

       - shutdown -h 1：表示1分钟后关机

       - shutdown -r now：立即重启

       - halt：表示立即关机

       - reboot：重启系统

       - sync：将内存的输入写入到磁盘。__管是关机还是重启，都需要先执行该命令__
  - 用户的登录和注销
      - 基本介绍
          - 登录时尽量少用root账户登录，因为它是系统管理员，最大的权限，避免操作失误。可以利用普通用户登录，登录后在用“su -用户名”命令来切成系统管理员
          - 在提示符下输入 __logout__即可注销账户

## 用户管理

### 使用说明 
[CSDN用户组详细说明]([https://www.cnblogs.com/suwanbin/p/12056873.html#%E6%B7%BB%E5%8A%A0%E7%94%A8%E6%88%B7-useradd](https://www.cnblogs.com/suwanbin/p/12056873.html#添加用户-useradd))

- Linux系统是一个多用户多任务的操作系统，任何一个使用系统资源的用户，都必须向系统管理员申请一个帐号，然后以这个帐号的身份进入系统。

- Linux用户需要至少属于一个组

### 常用命令

  - 添加用户：

    - `useradd [选项] 用户名`

      - 文件选项 `-d 指定目录 用户名`

    - 当创建成功用户后，会自动创建用户的home/用户名目录。__（ubuntu20.04 不可）__

      > `useradd xm` *系统并没有自动创建`home/xm `目录*
      >
      > - 说明：在Centos7中，该命令直接创建了`/home/xm` 目录，但是在Ubuntu中，只创建了用户
      >
      > `useradd -d /home/xm1 xm1` *系统创建用户，但并未创建/home/xm1目录*
      >
      > `useradd -m xm2` *系统自动创建用户，并创建/home/xm2目录*
      >
      > `useradd -d /home/xm3 -m xm3` *系统自动创建xm3用户，并将用户的/home/xm3目录给用户链接上*

    - 创建账户之后修改账户的登录密码`passwd 用户名`

    - <u>注意：创建用户之后如果登录新用户只显示$符号，此时需要执行`usermod -s /bin/bash 用户名`</u>

  - 删除用户：

    - 保留/home/用户名目录：`userdel 用户名` ***一般不会删除该home目录***
    - 不保留/home/用户名目录：`userdel -r 用户名`

  - 查询id用户信息

    - `id 用户名`

  - 切换账户

    - `su -用户名`  *从权限高的账户切换到权限低的账户时不需要输入密码*
    - `exit`  返回切换前的用户

  - 查询当前用户指令

    - `whoami`

      ``` shell
      [root@localhost hc]# whoami
      root
      ```

      

- 用户组：类似于角色，系统可以对有共性的多个用户进行统一管理。

  - 添加用户组：
    - `groupadd 组名`
  - 删除组
    - `groupdel 组名`
  - 创建用户的时候直接加入组操作
    - `useradd -g 用户组 用户名`
  - 修改用户组的指令
    - `usermod -g 用户组 用户名`

- 相关配置文件
  - `/etc/passwd`  
    - 用户user的配置文件，记录用户的各种信息。
    - 每行的含义：*用户名：口令：用户标识号：注释性描述：主目录：登录shell*
  - `/etc/group/` 
    - 组group的配置文件，记录linux包含组的信息
    - 每行含义：*组名：口令：组标识号：组内用户列表*
  - `/etc/shadow/` 
    - 口令配置文件
    - 每行的含义：*登录名：加密口令：最后一次修改时间：最小时间间隔：最大时间间隔：警告时间：不活动时间：失效时间：标志*

## 实用指令

 ### 系统运行级别
- 级别分类
  	0：关机模式
    1：单用户模式（该模式下登录系统可以不需要输入密码，常用作找回root密码使用）
    2：多用户无网络服务模式
    3：多用户有网络服务模式
    4：保留模式
    5：图形界面模式
    6：重启模式

   - 一般运行级别的配置文件在`/etc/inittab`文件中，但是ubuntu操作系统不存在该文件都在`/etc/init/`中

### 帮助指令

  - 当我们对某个指令不熟悉的时候，可以使用Linux的帮助指令来了解指令的使用方法

    - man 获取帮助信息

      - `man [命令或配置文件]`

    - help 获取帮助信息

      - `help [命令或配置文件]`

      以上两种方式如果英文文档无法读懂，最好的方式google一下

 ### 文件目录类
- `pwd` 显示当前工作目录的绝对路径

- `ls [选项] [目录或者文件]` 显示文件信息

    - `-a` 显示当前目录的所有文件，包括隐藏文件
    - `-l` 长型排列，显示当前目录的文件及信息，但是不包括隐藏文件

- `cd [参数]` 切换制定目录
- `mkdir [选项] 要创建目录`

    - `-p`  创建多级目录 确保文件目录存在，不存在就创建一个，但是直接使用`mkdir`来创建的话，多级目录会报错。`mkdir test/test1`报错，另外，创建文件的时候不要在test的前面加上`/`否则会变成隐藏文件。

- `rmdir [选项] 要删除的目录`

    -  删除多级目录。
    - 另外如果文件夹中有文件的话，`rmdir`是无法删除的，此时必须要使用`rm -rf` 命令。

- `touch` 用来修改文件或目录的时间属性，包括存取时间和更改时间，如果文件目录不存在，就创建一个新的文件。

    - ```shell
        touch [-acfm][-d<日期时间>][-r<参考文件或目录>] [-t<日期时间>][--help][--version][文件或目录…]
        
        ```

    - <u>创建一个空文件，类似于windows下的新建一个空文件,可以一次性创建多个文件</u>

- `cp`  主要用于复制文件和目录

    - ```shell
        cp [options] source dest 或 cp [options] source... directory
        ```

    - 参数说明

        - `-a` 通常在复制目录时使用，会保留链接，文件属性，并复制目录下所有内容。其作用相当于`dpr`组合
    - `-d` 复制是保留链接，这里的链接相当于windows的快捷方式。
      
        - `-f` 覆盖已经存在的目标文件而不给出提示。（也可以使用在`\cp` 来实现强制覆盖而不会提示）
    - `-i` 与`-f` 相反，覆盖已经存在的目标文件时，给出提示，要求确认是否覆盖，回答“y”后覆盖目标文件。
      
        - `-p` 除了复制内容之外，还把修改时间和访问权限也复制到新文件中。
    - <u>`-r` 若给出的是目录文件，则复制目录下所有子目录和文件。（常用）</u>
      
    - `-l` 不复制文件，只是生成链接文件。
      
    - 注意：

        - 一定要注意你当前所在目录，清楚源目录和目标目录。

- `rm`指令 移除文件和目录

     - 常用选项
       	- `-r` 递归删除所有文件
       	- `-f`  强制删除而不提醒

- `mv` 移动文件或重命名

    - 在同一个文件夹中使用时重命名

        ```shell
        hc@hc-RV411:~$ ls
         aaa.txt            Documents           node_modules   share       Videos
         bbb                Downloads           owncloud       snap        workspace
        'Calibre Library'   eclipse-workspace   Pictures       Templates
         Desktop            Music               Public         testfile
        hc@hc-RV411:~$ mv aaa.txt bbb.txt
        hc@hc-RV411:~$ ls
         bbb                Documents           node_modules   share       Videos
         bbb.txt            Downloads           owncloud       snap        workspace
        'Calibre Library'   eclipse-workspace   Pictures       Templates
         Desktop            Music               Public         testfile
        hc@hc-RV411:~$ mv bbb.txt bbb/
        hc@hc-RV411:~$ ls
         bbb                Downloads           owncloud   snap        workspace
        'Calibre Library'   eclipse-workspace   Pictures   Templates
         Desktop            Music               Public     testfile
         Documents          node_modules        share      Videos
        hc@hc-RV411:~$ ls bbb/
        aaa.txt  bbb.txt
        ```


​            

- `cat`查看文件内容，以只读的方式

    ```shell
    hc@hc-RV411:~$ cat -n /etc/profile |more
    ```

- `more` 是一个基于VI编辑器的文本过滤器，它以全屏幕的方式按页显示文本文件的内容。more指令中内置了若干快捷键，详见操作说明。

- `less` 用来分屏查看文件内容，功能与more指令类似，但是比more指令更加强大，支持各种显示终端。less指令在显示文件时，并不是将整个文件一次将整个文件加载之后才显示，而是根据显示需要加载内容，对于显示大型问家具有较高的效率。

    - `enter`向下一行，`space` 向下一页

- `>` he`>>`

    - `>`  输出重定向  会将原来的内容覆盖掉

    - `>>`追加 不会覆盖原来的内容，会追加在文件末尾

    - 实例

        - ```shell
            hc@hc-RV411:~$ touch info.txt       
            hc@hc-RV411:~$ ls -l > info.txt
            ```

        - ```shell
            hc@hc-RV411:~$ echo "hello world" >> info.txt
            hc@hc-RV411:~$ cat -n info.txt
                 1	total 64
                 2	drwxrwxr-x   2 hc   hc   4096  6月 25 16:55 bbb
                 3	drwxrwxr-x   3 hc   hc   4096  4月 18 21:51 Calibre Library
                 4	drwxr-xr-x   2 hc   hc   4096  6月 25 01:28 Desktop
                 5	drwxr-xr-x   3 hc   hc   4096  6月 25 01:13 Documents
                 6	drwxr-xr-x   5 hc   hc   4096  6月 24 18:40 Downloads
                 7	drwxrwxr-x   3 hc   hc   4096  4月  5 09:32 eclipse-workspace
                 8	-rw-rw-r--   1 hc   hc      0  6月 25 17:27 info.txt
                 9	drwxr-xr-x   2 hc   hc   4096 10月  6  2019 Music
                10	drwxr-xr-x 110 hc   hc   4096  4月  4 12:23 node_modules
                11	drwxr-xr-x  12 hc   hc   4096  9月 17  2018 owncloud
                12	drwxr-xr-x   2 hc   hc   4096 10月  6  2019 Pictures
                13	drwxr-xr-x   2 hc   hc   4096 10月  6  2019 Public
                14	drwxrwxrwx   2 root root 4096  4月  7 22:50 share
                15	drwxr-xr-x   5 hc   hc   4096  6月 24 17:07 snap
                16	drwxr-xr-x   2 hc   hc   4096 10月  6  2019 Templates
                17	-rw-rw-r--   1 hc   hc      0  6月 25 13:28 testfile
                18	drwxr-xr-x   2 hc   hc   4096 10月  6  2019 Videos
                19	drwxr-xr-x   9 hc   hc   4096  4月  7 21:56 workspace
                20	hello world
        ​```
            ```


- `echo`指令 输出内容到控制台

  hc@hc-RV411:~$ echo $JAVA_HOME
  /opt/jdk1.8.0_251
  hc@hc-RV411:~$ echo "hello world"
  hello world




- `head`指令 用于显示文件的开头部分内容，默认情况下head指令显示文件的前10行内容

  hc@hc-RV411:~$ head -n 5 /etc/profile


- `tail`用于输出文件中尾部的内容，默认情况下tail指令显示文件的后10行内容

  - 基本语法

    - `tail 文件`查看文件后10行内容
    - `tail -n 5 文件` 查看文件后5行内容，5可以是任意数字
    - `tail -f 文件` 实时追踪该文档的所有更新，<u>工作经常使用</u>

  - 应用实例

    - 查看/etc/profile 最后5行的代码

  ```
  hc@hc-RV411:~$ tail -n -5 /etc/profile
  export JAVA_HOME=/opt/jdk1.8.0_251
  export JRE_HOME=/opt/jdk1.8.0_251/jre
  export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
  export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
  ```
  
  


- 实时监控mydate.txt，看看文件有变化时，是否可以看到，实时的追加日期

- `ln`指令

  - 软链接也叫符号链接，类似于windows里的快捷方式，主要存放了链接其他文件的路径
  - 基本语法
    - `ln -s [原文件或目录] [软链接名]` 给源文件创建一个软链接

- `history` 指令
- 查看已经执行过历史命令，也可以执行历史指令
  - 基本语法
    - `history`  查看全部历史指令
    - `history 10`  查看最新的10条指令
    - `! 176`  执行第176个执行

### 时间日期类

 - `date`：显示当前日期和时间

- `date “+%Y”`：显示当前年份

- `date “+%d”`：显示当前月份

- `date “+%Y-%m-%d %H:%M:%S”`：显示年-月-日 时：分：秒

- 设置日期：date -s 字符串时间

- `cal`：查看日历指令；`cal 年份`：显示某一年一整年的日

- 练习案例

  ```shell
  hc@hc-RV411:~$ date
  2020年  6月 25日 木曜日 20:29:04 JST
  hc@hc-RV411:~$ date "+%Y"
  2020
  hc@hc-RV411:~$ date "+%d"
  25
  hc@hc-RV411:~$ date "+%m"
  06
  hc@hc-RV411:~$ date "+%Y-%m-%d %H:%M:%S"
  2020-06-25 20:31:35
  hc@hc-RV411:~$ date -s "^C
  hc@hc-RV411:~$ date -s "2020-06-24 20:31:35"
  date: cannot set date: Operation not permitted
  2020年  6月 24日 水曜日 20:31:35 JST
  hc@hc-RV411:~$ date
  2020年  6月 25日 木曜日 20:33:04 JST
  hc@hc-RV411:~$ cal
        6月 2020         
  日 月 火 水 木 金 土  
      1  2  3  4  5  6  
   7  8  9 10 11 12 13  
  14 15 16 17 18 19 20  
  21 22 23 24 25 26 27  
  28 29 30              
                        
  hc@hc-RV411:~$ cal 2020 
                              2020
           1月                    2月                    3月           
  日 月 火 水 木 金 土  日 月 火 水 木 金 土  日 月 火 水 木 金 土  
            1  2  3  4                     1   1  2  3  4  5  6  7  
   5  6  7  8  9 10 11   2  3  4  5  6  7  8   8  9 10 11 12 13 14  
  12 13 14 15 16 17 18   9 10 11 12 13 14 15  15 16 17 18 19 20 21  
  19 20 21 22 23 24 25  16 17 18 19 20 21 22  22 23 24 25 26 27 28  
  26 27 28 29 30 31     23 24 25 26 27 28 29  29 30 31              
                                                                    
  
           4月                    5月                    6月           
  日 月 火 水 木 金 土  日 月 火 水 木 金 土  日 月 火 水 木 金 土  
            1  2  3  4                  1  2      1  2  3  4  5  6  
   5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13  
  12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20  
  19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27  
  26 27 28 29 30        24 25 26 27 28 29 30  28 29 30              
                        31                                          
  
           7月                    8月                    9月           
  日 月 火 水 木 金 土  日 月 火 水 木 金 土  日 月 火 水 木 金 土  
            1  2  3  4                     1         1  2  3  4  5  
   5  6  7  8  9 10 11   2  3  4  5  6  7  8   6  7  8  9 10 11 12  
  12 13 14 15 16 17 18   9 10 11 12 13 14 15  13 14 15 16 17 18 19  
  19 20 21 22 23 24 25  16 17 18 19 20 21 22  20 21 22 23 24 25 26  
  26 27 28 29 30 31     23 24 25 26 27 28 29  27 28 29 30           
                        30 31                                       
  
          10月                   11月                   12月           
  日 月 火 水 木 金 土  日 月 火 水 木 金 土  日 月 火 水 木 金 土  
               1  2  3   1  2  3  4  5  6  7         1  2  3  4  5  
   4  5  6  7  8  9 10   8  9 10 11 12 13 14   6  7  8  9 10 11 12  
  11 12 13 14 15 16 17  15 16 17 18 19 20 21  13 14 15 16 17 18 19  
  18 19 20 21 22 23 24  22 23 24 25 26 27 28  20 21 22 23 24 25 26  
  25 26 27 28 29 30 31  29 30                 27 28 29 30 31        
                                                                    
  hc@hc-RV411:~$ 
  
  ```

  

### 搜索查找类

 - `find`指令 	将从指定目录向下递归地遍历其各个子目录，将满足条件的文件或者目录显示在终端

    - `find 搜索范围 -name 文件名` 按照指定的文件名查找

      ```shell
      hc@hc-RV411:~$ find /home -name hello.txt
      /home/hc/hello.txt
      ```

    - `find 搜索范围 -user 用户名 按照指定的用户名查找`

      ```shell
      hc@hc-RV411:~$ find /home/hc/bbb -user hc
      /home/hc/bbb
      /home/hc/bbb/bbb.txt
      /home/hc/bbb/aaa.txt
      ```

    - `find 搜索范围 -size +n/-n/n 文件名`  按照指定的文件大小查找 

      ```shell
      hc@hc-RV411:~$ find /home/hc/bbb -size +200k
      /home/hc/bbb/aaa.txt
      hc@hc-RV411:~$ find /home/hc/bbb -size 244k
      /home/hc/bbb/aaa.txt
      hc@hc-RV411:~$ find /home/hc/bbb -size -200k
      /home/hc/bbb
      /home/hc/bbb/bbb.txt
      ```

 - `locate`指令   可以快速定位文件路径。locate指令利用事先建立的系统中所有文件名称及路径的locate数据库实现快速定位给定的文件。locate指令无需遍历整个文件系统，查询速度较快。为了保证查询结果的准确度，管理员必须定期更新locate时刻

    - 基本语法

       - `locate 搜索文件`

   - 特别说明

     - 由于locate指令基于数据库进行查询，所以第一次运行前，必须使用updatedb指令创建locate数据库。

   - 案例：

     ```shell
     hc@hc-RV411:~$ sudo updatedb
     [sudo] password for hc: 
     /usr/bin/find: '/run/user/1000/doc': Permission denied
     /usr/bin/find: '/run/user/1000/gvfs': Permission denied
     /usr/bin/find: '/run/user/125/gvfs': Permission denied
     hc@hc-RV411:~$ locate hello.txt
     /home/hc/hello.txt
     /usr/share/doc/syslinux-common/asciidoc/hello.txt
     
     ```

     ***注意：这里在创建locate数据库的时候，需要权限才能够进行创建，否则创建不成功。***

- `grep`指令   过滤查找，表示讲前面一个命令的处理结果传递给后面的命令处理。经常跟管道一起使用。

  - `grep [选项] 查找内容 原文件`

  - `-n` 显示匹配行及行号

  - `-i` 忽略大小写字母  

    ```shell
    hc@hc-RV411:~/bbb$ cat bbb.txt | grep yes
    yes
    yes
    hc@hc-RV411:~/bbb$ cat bbb.txt | grep -n yes
    4:yes
    6:yes
    hc@hc-RV411:~/bbb$ cat bbb.txt | grep -ni yes
    4:yes
    6:yes
    8:Yes
    ```


###  压缩和解压缩

 - `gzip`和`gunzip`指令

    - `gzip`用于压缩命令，`gunzip`用于解压缩命令

    - 基本语法

       - `gzip 文件` 压缩文件，只能将文件压缩为`*.gz`格式。

         ```shell
         hc@hc-RV411:~/bbb$ gzip aaa.txt
         hc@hc-RV411:~/bbb$ ls
         aaa.txt.gz  bbb.txt
         ```

         <u>`gzip`指令进行压缩时，原文件会被压缩文件替代。</u>

       - `gunzip 文件` 解压缩文件。

         ```shell
         hc@hc-RV411:~/bbb$ gunzip aaa.txt.gz 
         hc@hc-RV411:~/bbb$ ls
         aaa.txt  bbb.txt
         ```

- `zip`和`unzip`指令

  - `zip`用于压缩指令 `unzip` 用于解压缩命令

  - 基本语法

    - `zip[选项] 压缩文件 将要压缩的内容` 

      - `-r` 

        ```shell
        hc@hc-RV411:~$ zip -r bbb.zip /home/hc/bbb/
          adding: home/hc/bbb/ (stored 0%)
          adding: home/hc/bbb/bbb.txt (deflated 56%)
          adding: home/hc/bbb/aaa.txt (deflated 100%)
        hc@hc-RV411:~$ ls
         bbb      'Calibre Library'   Documents   eclipse-workspace   info.txt   node_modules   Pictures   share   Templates   Videos
         bbb.zip   Desktop            Downloads   hello.txt           Music      owncloud       Public     snap    testfile    workspace
        ```

        

    - `unzip[选项] 解压缩文件`

      - `-d` 

        ```shell
        hc@hc-RV411:~$ unzip -d /home/hc bbb.zip
        Archive:  bbb.zip
           creating: /home/hc/home/hc/bbb/
          inflating: /home/hc/home/hc/bbb/bbb.txt  
          inflating: /home/hc/home/hc/bbb/aaa.txt  
        hc@hc-RV411:~$ ls
         bbb.zip            Desktop     Downloads           hello.txt   info.txt   node_modules   Pictures   share   Templates   Videos
        'Calibre Library'   Documents   eclipse-workspace   home        Music      owncloud       Public     snap    testfile    workspace
        
        ```

- `tar`指令  打包指令，最后打包后的文件是.tar.gz的文件

  - 基本语法

    - `tar [选项] xxx.tar.gz 打包的内容`

      - `-c` 产生`.tar`打包文件
      - `-v`显示详细信息
      - `-f`指定压缩后的文件名
      - `-z` 打包同时压缩
      - `-x`解包`.tar`文件

    - 应用实例

      - 压缩多个文件，讲/home/a.txt和/home/b.txt压缩成a.tar.gz

        ```shell
        hc@hc-RV411:~$ tar -zcvf a.tar.gz a.txt b.txt
        a.txt
        b.txt
        hc@hc-RV411:~$ ls
         a.tar.gz   bbb.zip  'Calibre Library'   Documents   eclipse-workspace   info.txt   node_modules   Pictures   share   Templates   Videos
         a.txt      b.txt     Desktop            Downloads   hello.txt           Music      owncloud       Public     snap    testfile    workspace
        
        ```

        

      - 将/home/的文件夹进行压缩生成myhome.tar.gz

        ```shell
        hc@hc-RV411:~$ tar -zcvf ccc.tar.gz ccc/
        ccc/
        ccc/a.txt
        ccc/b.txt
        ```

      - 将a.tar.gz解压到当前目录

        ```shell
        hc@hc-RV411:~$ tar -zxvf ccc.tar.gz
        ccc/
        ccc/a.txt
        ccc/b.txt
        ```

      - 将myhome.tar.gz解压到ddd/目录下

        ```shell
        hc@hc-RV411:~$ tar -zxvf ccc.tar.gz -C ddd/
        ccc/
        ccc/a.txt
        ccc/b.txt
        hc@hc-RV411:~$ ls ddd/
        ccc
        ```



## 组管理和权限管理

### 组管理

- 文件属性

  - 所有者
  - 所在组
  - 其他组
  - 改变用户所有组

- 文件/目录所有者

  - 一般为文件的创建者，谁创建了改文件，就自然属于该创建者。<u>文件所有者不一定是文件的创建者</u>

  - 查看文件所有者：`ls -ahl`  all 所有文件， human 以人容易理解的方式，list 列表形式显示

    ```shell
    tom@hc-RV411:~$ ls -ahl
    total 20K
    drwxr-xr-x 4 tom  testgroup 4.0K  6月 26 11:15 .
    drwxr-xr-x 5 root root      4.0K  6月 26 11:04 ..
    -rw------- 1 tom  testgroup   31  6月 26 11:14 .bash_history
    drwx------ 4 tom  testgroup 4.0K  6月 26 11:15 .cache
    drwxr-xr-x 3 tom  testgroup 4.0K  6月 26 11:15 .local
    -rw-r--r-- 1 tom  testgroup    0  6月 26 11:15 test.txt
    ```

  - 修改文件的所有者：`chown 用户名 文件名`  ***change owner***  该命令仅系统管理员可以使用，因为其他组用户没有权限改变另外一组的文件的属性

    ```shell
    root@hc-RV411:/home/tom# chown hc test.txt
    root@hc-RV411:/home/tom# ls -ahl
    total 20K
    drwxr-xr-x 4 tom  testgroup 4.0K  6月 26 11:15 .
    drwxr-xr-x 5 root root      4.0K  6月 26 11:04 ..
    -rw------- 1 tom  testgroup   31  6月 26 11:14 .bash_history
    drwx------ 4 tom  testgroup 4.0K  6月 26 11:15 .cache
    drwxr-xr-x 3 tom  testgroup 4.0K  6月 26 11:15 .local
    -rw-r--r-- 1 hc   testgroup    0  6月 26 11:15 test.txt
    ```

    

- 组的创建及改变

  - `groupadd 组名`

  - `chgrp 组名 文件名`

    ```shell
    root@hc-RV411:/home/tom# ls -ahl
    total 20K
    drwxr-xr-x 4 tom  testgroup 4.0K  6月 26 11:15 .
    drwxr-xr-x 5 root root      4.0K  6月 26 11:04 ..
    -rw------- 1 tom  testgroup   31  6月 26 11:14 .bash_history
    drwx------ 4 tom  testgroup 4.0K  6月 26 11:15 .cache
    drwxr-xr-x 3 tom  testgroup 4.0K  6月 26 11:15 .local
    -rw-r--r-- 1 hc   hc           0  6月 26 11:15 test.txt
    ```

- 其他组

  - 除了文件的所有者和所在组之外，系统的其他用户都是该文件的其他组。

- 改变用户所在组

  - 在添加用户时，可以直接指定该用户添加到哪个组中，同样的用root的管理权限也可以修改文件的所在组 `useradd -g 组名 用户名`
  - 改变用户所在的组：`usermod -g 组名 用户名`
  - 改变用户登录的初始目录：`usermod -d 目录名 用户名`

### 权限管理

 - 权限的基本介绍

    - ```shell
      -rw-r--r-- 1 hc   hc           0  6月 26 11:15 test.txt
      ```

       - 0-9位的详细说明

          - 第0位:确定文件的类型。d：文件夹；- 普通文件；c 字符设备【键盘、鼠标等】；b 块文件【硬盘】
          - 1-3 ：文件的所有者权限
          - 4-6 ：文件的所在组权限
          - 7-9：文件的其他组权限

      - ls -l 显示内容说明：

        - rw-：表示文件所有者权限（rw，读写）
        - r--：表示文件所在组的用户的权限（r，只有读的权限）
        - r--：表示文件其他组的用户的权限（r，只有读的权限）
        - 1：如果是文件，表示硬连接的数；如果是目录则表示该目录的子目录个数
        - tom：文件所有者
        - bandit：文件所在组
        - 0：文件的大小，0个字节；如果是目录，则统一为4096
        - July 1 13：40：文件最后的修改时间
        - ok.txt：文件名

        ![img](https://img-blog.csdnimg.cn/20190701154715856.png)

      - `rwx`权限详解

        - `rwx`作用到文件：
          - r：read，可读。读取查看。
          - w：write，可以修改。但不代表可以删除该文件。删除一个文件的前提条件是对该文件所在的目录有写权限，才能删除该文件。
          - x：execute，可执行。可以被执行。
        - `rwx`作用到目录：
          - r：可以读取，ls查看目录内容。
          - w：可以修改，目录内创建+删除+重命名目录。
          - x：可执行，可以进入该目录。

      - 修改权限 
        - 通过给user group 或者other加减权限的方式
          - u 所有者 g 所在组 o 其他组；a 所有人
          - `chmod u=rwx，g=rx，o=x 文件目录名`：分别权限
          - `chmod o+w 文件目录名`：给其他人都增加写的权限
          - `chmod a-x 文件目录名`：给所有的用户都减掉执行权限
        - 通过数字的方式
          - 规则：`r=4 w=2 x=1 rwx=4+2+1=7`
          - `chmod u=rwx，g=rx，o=x 文件目录名 `**等价于** `chmod 751 文件目录名`

      - 修改文件的所有者
        - 修改文件所有者` chown`
          - `chown newowner file`：改变文件的所有者
          - `chown newowner：newgroup file`：改变用户的所有者和所在组
          - `-R`：如果是目录，则使其下所有子文件或目录递归生效
        - 修改文件所在组 `chgrp`
          - `chgrp newgroup file`：改变文件的所有组
          - `-R`：如果是目录，则使其下所有子文件或目录递归生效

## 定时任务调度 (跳过未练习)

	### `crond`任务调度

  - crontab进行定时任务调度
      - 基本语法 `crontab [选项]`
      - `-e` 编辑crontab定时任务
      - -i：查询crontab任务
    - -r：删除当前用户所有的crontab任务
    - -l：列出当前有哪些任务调度
    - `service crond restart`：重启任务调度
    - 当保存退出后就生效了
    - 参数细节说明

| 项目      | 含义                 | 范围                    |
| --------- | -------------------- | ----------------------- |
| 第一个“*” | 一小时当中的第几分钟 | 0-59                    |
| 第二个“*” | 一天当中的第几小时   | 0-23                    |
| 第三个“*” | 一个月当中的第几天   | 1-31                    |
| 第四个“*” | 一年当中的第几月     | 1-12                    |
| 第五个“*” | 一周当中的星期几     | 0-7（0和7都代表星期日） |

特殊符号说明

- `*`：代表任何时间。比如第一个`*`就代表一小时中每分钟都执行一次的意思。

- `,`：代表不连续的时间。比如“0 8,12,16 * * *命令”，就代表在每天的8点0分，12点0分，16点0分都执行一次命令。

- `-`：代表连续的时间范围。比如“0 5 * * 1-6命令”，代表在周一到周六的凌晨5点0分执行命令。

- `/n`：代表每隔多久执行一次。比如“*/10 * * * * 命令”，代表每隔10分钟就执行一遍命令

  

## Linux磁盘分区和挂载



### 分区基本知识

- 分区的两种方式
  - `mbr`分区
    - 最多支持四个主分区
    - 系统只能够安装在主分区
    - 扩展分区要占用一个主分区
    - `mbr`最大支持2TB，但拥有最好的兼容性
  - `gtp`分区
    - 支持无限多个主分区（但操作系统可能限制，windows下最多128个分区）
    - 最大支持18EB的容量（1EB=1024PB，1PB=1024TB）
    - Windows7 64位之后支持`gtp`分区

### Linux分区

- 原理介绍

  - Linux来说无论有几个分区，分给哪一个目录使用，它归根结底都只有一个根目录，一个独立且唯一的文件结构，Linux中每个分区都是用来组成整个文件系统的一部分。
    - Linux采用了一种“载入”的方式，它的整个文件系统中包含了一整套的文件和目录，且将一个分区和一个目录联系起来。这时将载入的分区将它的存储空间在一个目录下获得。

- 硬盘说明

  - Linux硬盘分区IDE硬盘和SCSI硬盘两种，目前基本上都是SCSI硬盘

  - Linux查看硬盘挂在的指令：`lsblk` `lsblk -f`

    ```shell
    hc@hc-RV411:~$ lsblk -f
    NAME   FSTYPE   LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT
    loop0  squashfs                                                  0   100% /snap/core18/1705
    loop1  squashfs                                                  0   100% /snap/core18/1754
    loop2  squashfs                                                  0   100% /snap/gnome-3-34-1804/24
    loop3  squashfs                                                  0   100% /snap/snap-store/433
    loop4  squashfs                                                  0   100% /snap/snap-store/467
    loop5  squashfs                                                  0   100% /snap/gnome-3-34-1804/36
    loop6  squashfs                                                  0   100% /snap/snapd/8140
    loop7  squashfs                                                  0   100% /snap/snapd/7264
    loop8  squashfs                                                  0   100% /snap/vim-editor/1
    loop9  squashfs                                                  0   100% /snap/gtk-common-themes/1506
    sda                                                                       
    éāsda1 ext4           d95aa845-7726-4f4f-9308-c5e2315a716d    274G     1% /home
    sdb                                                                       
    ěāsdb1 ext4           542a729a-da2f-4a4f-aff4-9897c80c1f03  680.6M    21% /boot
    ěāsdb2                                                                    
    ěāsdb5 swap           ddba9696-4d7b-408b-8233-a7eec856b73e                [SWAP]
    éāsdb6 ext4           c8feb4a8-c3af-4d26-b79d-2fc85552cf85   86.6G     9% /
    sdc                                                                       
    éāsdc1 ntfs           583211C03211A452                      624.7G    33% /media/hc/583211C03211A452
    ```

    ```shell
    hc@hc-RV411:~$ lsblk
    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
    loop0    7:0    0    55M  1 loop /snap/core18/1705
    loop1    7:1    0    55M  1 loop /snap/core18/1754
    loop2    7:2    0 240.8M  1 loop /snap/gnome-3-34-1804/24
    loop3    7:3    0  49.8M  1 loop /snap/snap-store/433
    loop4    7:4    0  49.8M  1 loop /snap/snap-store/467
    loop5    7:5    0 255.6M  1 loop /snap/gnome-3-34-1804/36
    loop6    7:6    0  29.8M  1 loop /snap/snapd/8140
    loop7    7:7    0  27.1M  1 loop /snap/snapd/7264
    loop8    7:8    0  10.5M  1 loop /snap/vim-editor/1
    loop9    7:9    0  62.1M  1 loop /snap/gtk-common-themes/1506
    sda      8:0    0 298.1G  0 disk 
    └─sda1   8:1    0 298.1G  0 part /home
    sdb      8:16   0 111.8G  0 disk 
    ├─sdb1   8:17   0   976M  0 part /boot
    ├─sdb2   8:18   0     1K  0 part 
    ├─sdb5   8:21   0   7.5G  0 part [SWAP]
    └─sdb6   8:22   0 103.4G  0 part /
    sdc      8:32   0 931.5G  0 disk 
    └─sdc1   8:33   0 931.5G  0 part /media/
    hc/583211C03211A452
    
    
    ```
### 增加一块硬盘

  - 添加一块硬盘
  - 分区 `fdisk /dev/sdb`  该指令下有很多命令，可以完成硬盘的分区，卸载等操作，具体查看该指令的help
  - 格式化  `mkfs -t ext4 /dev/sdb` 
  - 挂在 `mount /dev/sdb /home/newdisk` 解除挂载关系 `umount 硬盘 挂载点`  
  - 永久挂在 编辑`/etc/fstab`  编辑完成之后执行`mount -a`

### 磁盘情况查询

 - 查询系统整体磁盘使用情况

    - 基本语法 `df -h` 磁盘使用情况

      ``` shell
      hc@hc-RV411:~$ df -lh
      Filesystem      Size  Used Avail Use% Mounted on
      udev            1.9G     0  1.9G   0% /dev
      tmpfs           380M  3.7M  377M   1% /run
      /dev/sdb6       102G  9.5G   87G  10% /
      tmpfs           1.9G     0  1.9G   0% /dev/shm
      tmpfs           5.0M  4.0K  5.0M   1% /run/lock
      tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
      /dev/loop2      241M  241M     0 100% /snap/gnome-3-34-1804/24
      /dev/loop0       55M   55M     0 100% /snap/core18/1705
      /dev/loop3       50M   50M     0 100% /snap/snap-store/433
      /dev/loop4       50M   50M     0 100% /snap/snap-store/467
      /dev/loop5      256M  256M     0 100% /snap/gnome-3-34-1804/36
      /dev/loop1       55M   55M     0 100% /snap/core18/1754
      /dev/loop6       30M   30M     0 100% /snap/snapd/8140
      /dev/loop7       28M   28M     0 100% /snap/snapd/7264
      /dev/loop8       11M   11M     0 100% /snap/vim-editor/1
      /dev/loop9       63M   63M     0 100% /snap/gtk-common-themes/1506
      /dev/sdb1       945M  200M  681M  23% /boot
      /dev/sda1       293G  3.5G  275G   2% /home
      tmpfs           380M   20K  380M   1% /run/user/125
      tmpfs           380M   40K  380M   1% /run/user/1000
      tmpfs           380M  4.0K  380M   1% /run/user/1001
      /dev/sdc1       932G  307G  625G  33% /media/hc/583211C03211A452
      ```
      
      - 查询指定目录的磁盘占用情况

           - 基本语法  `du [选项] 目录`

                 - `-s`指定目录占用大小汇总
             - `-h` 带计量单位
                 - `-a` 含文件
             - `--max-depth=1` 子目录深度
                 - `-c` 列出明细的同时，增加汇总值

        - 应用实例

          - 查询`/opt`目录的磁盘占用情况，深度为1

              ``` shell
              hc@hc-RV411:~$ du -ach --max-depth=1 /opt
              392M	/opt/jdk1.8.0_251
              605M	/opt/eclipse
              226M	/opt/google
              1.2G	/opt
              1.2G	total
              ```
      
    - 磁盘情况-工作使用指令

      - 统计/home 文件夹下文件的个数

        ``` shell
        hc@hc-RV411:~$ ls -l
        total 84
        -rw-rw-r--   1 hc hc  119  6月 26 08:32  a.tar.gz
        -rw-rw-r--   1 hc hc    0  6月 26 08:32  a.txt
        -rw-rw-r--   1 hc hc 1305  6月 26 08:20  bbb.zip
        -rw-rw-r--   1 hc hc    0  6月 26 08:32  b.txt
        drwxrwxr-x   3 hc hc 4096  4月 18 21:51 'Calibre Library'
        drwxrwxr-x   2 hc hc 4096  6月 26 15:05  ccc
        -rw-rw-r--   1 hc hc  143  6月 26 08:38  ccc.tar.gz
        drwxrwxr-x   3 hc hc 4096  6月 26 08:41  ddd
        drwxr-xr-x   2 hc hc 4096  6月 25 01:28  Desktop
        drwxr-xr-x   3 hc hc 4096  6月 25 01:13  Documents
        drwxr-xr-x   5 hc hc 4096  6月 24 18:40  Downloads
        drwxrwxr-x   3 hc hc 4096  4月  5 09:32  eclipse-workspace
        -rw-rw-r--   1 hc hc    0  6月 25 21:05  hello.txt
        -rw-rw-r--   1 hc hc  997  6月 25 17:28  info.txt
        drwxr-xr-x   2 hc hc 4096 10月  6  2019  Music
        drwxr-xr-x 110 hc hc 4096  4月  4 12:23  node_modules
        drwxr-xr-x  12 hc hc 4096  9月 17  2018  owncloud
        drwxr-xr-x   2 hc hc 4096 10月  6  2019  Pictures
        drwxr-xr-x   2 hc hc 4096 10月  6  2019  Public
        drwxrwxrwx   3 hc hc 4096  6月 26 14:29  Shared
        drwxr-xr-x   5 hc hc 4096  6月 24 17:07  snap
        drwxr-xr-x   2 hc hc 4096 10月  6  2019  Templates
        -rw-rw-r--   1 hc hc    0  6月 25 13:28  testfile
        drwxr-xr-x   2 hc hc 4096 10月  6  2019  Videos
        drwxr-xr-x   9 hc hc 4096  4月  7 21:56  workspace
        hc@hc-RV411:~$ ls -l | grep "^-" | wc -l
        8
        ```

      - 统计/home 文件夹下目录的个数

        ``` shell
        hc@hc-RV411:~$ ls -l | grep "^d" | wc -l
        17
        ```

        

      - 统计/home 文件夹下文件的个数，及子文件夹下文件的个数

        ``` shell
        hc@hc-RV411:~$ ls -lR | grep "^-" | wc -l
        38810
        ```

        

      - 统计/home 文件夹下目录的个数，及子文件夹下目录的个数

        ``` shell
        hc@hc-RV411:~$ ls -lR | grep "^d" | wc -l
        5084
        ```

        

      - 以树状的形式显示目录结构

          ``` shell
        hc@hc-RV411:~/ccc$ tree
        .
        ├── a.txt
        ├── b.txt
        └── test
        ```

        

 ## 网络配置

- 指定固定IP：直接修改配置文件来指定IP，并可以连接到外网，编辑：`vim /etc/sysconfig/network-scripts/ifcfg-eth0`

- 重启网络服务：`service network restart`

​      

## 进程管理

### 查看进程

- 在Linux中，每个执行的**程序（代码）**都成为一个进程，每个进程都会分配一个ID号码

- 每一个进程，都会对应一个父进程，每一个父进程都可以复制多个子进程。例如WWW服务器。

- 每个进程都可能以两种方式存在:***前台***和***后台***

  - 前台进程：用户目前在屏幕上可以直接操作的。
  - 后台进程：实际在操作，但是在屏幕上无法看到的进程，通常使用后台的方式进行。

- 一般系统的服务都会以后台进程的形式存在，而且都会常驻在系统中，直到关机才结束。

- 显示系统执行的进程

  - `ps`  查看目前系统中，有哪些进程正在执行。

    ``` shell
      hc@hc-RV411:~$ ps
      PID TTY          TIME CMD
      22003 pts/0    00:00:00 bash
      22033 pts/0    00:00:00 ps
    ```

    <u>说明：PID ：进程识别号；TTY ：终端机号；TIME：此进程所消耗的CPU时间；CMD：正在执行的命令或者进程名。</u>

     - `ps -a` 显示当前终端的所有进程信息

       ``` shell
       hc@hc-RV411:~$ ps -a
           PID TTY          TIME CMD
          1009 tty1     00:00:05 Xorg
          1167 tty1     00:00:00 gnome-session-b
         16256 tty2     00:00:17 Xorg
         16263 tty2     00:00:00 gnome-session-b
         16339 tty2     00:00:00 fcitx <defunct>
         22035 pts/0    00:00:00 ps
       ```

  - `ps -u`以用户的格式显示当前进程信息

    ``` shell
    hc@hc-RV411:~$ ps -u
    USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    hc         16254  0.0  0.1 173660  6920 tty2     Ssl+ 14:17   0:00 /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
    hc         16263  0.0  0.3 198064 14280 tty2     Sl+  14:17   0:00 /usr/libexec/gnome-session-binary --systemd --systemd --session=ubuntu
    hc         16339  0.0  0.0      0     0 tty2     Z+   14:17   0:00 [fcitx] <defunct>
    hc         19552  0.0  0.1  20540  5580 pts/2    Ss+  14:20   0:00 bash
    hc         20833  0.0  0.1  20528  5420 pts/3    Ss+  19:42   0:00 -bash
    hc         22003  0.0  0.1  20528  5476 pts/0    Ss   21:24   0:00 -bash
    hc         22061  0.0  0.0  21140  3664 pts/0    R+   21:34   0:00 ps -u
    ```

    <u>user:用户名；PID：进程ID；CPU：占用的CPU；MEM：占用内存；VSZ：使用的虚拟内存；RSS：使用的物理内存情况；START：进程的状态 s 休眠 r 运行；TIME：启动时间；COMMAND：进程执行的时间</u>

  - `ps -x`显示后台进程运行的参数

    ``` shell
    hc@hc-RV411:~$ ps -x
        PID TTY      STAT   TIME COMMAND
       1484 ?        Ss     0:00 /lib/systemd/systemd --user
       1489 ?        S      0:00 (sd-pam)
       1495 ?        Ssl    0:00 /usr/bin/pulseaudio --daemonize=no --log-target=journal
       1497 ?        SNsl   0:00 /usr/libexec/tracker-miner-fs
       1501 ?        Ss     0:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
       1536 ?        Ssl    0:00 /usr/libexec/gvfsd
       1541 ?        Sl     0:00 /usr/libexec/gvfsd-fuse /run/user/1000/gvfs -f -o big_writes
       1553 ?        Ssl    0:03 /usr/libexec/gvfs-udisks2-volume-monitor
       1568 ?        Ssl    0:00 /usr/libexec/gvfs-mtp-volume-monitor
       1579 ?        Ssl    0:00 /usr/libexec/gvfs-goa-volume-monitor
       1583 ?        Sl     0:00 /usr/libexec/goa-daemon
       1643 ?        Sl     0:00 /usr/libexec/goa-identity-service
       1668 ?        Ssl    0:00 /usr/libexec/gvfs-gphoto2-volume-monitor
       1674 ?        Ssl    0:00 /usr/libexec/gvfs-afc-volume-monitor
      16250 ?        Sl     0:00 /usr/bin/gnome-keyring-daemon --daemonize --login
      16254 tty2     Ssl+   0:00 /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
      16263 tty2     Sl+    0:00 /usr/libexec/gnome-session-binary --systemd --systemd --session=ubuntu
      16330 ?        Ss     0:00 /usr/bin/ssh-agent /usr/bin/im-launch env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
      16339 tty2     Z+     0:00 [fcitx] <defunct>
      16341 ?        S      0:00 /usr/bin/fcitx -d
      16348 ?        Ss     0:00 /usr/bin/dbus-daemon --syslog --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
      16352 ?        SN     0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-0CBqBI8aNz,guid=861c0b1182f8f0e2d9c20f105ef584ec 16348
      16353 ?        Ssl    0:00 /usr/libexec/at-spi-bus-launcher
      16358 ?        S      0:00 /usr/bin/dbus-daemon --config-file=/usr/share/defaults/at-spi2/accessibility.conf --nofork --print-address 3
      16366 ?        Ssl    0:00 /usr/libexec/gnome-session-ctl --monitor
      16373 ?        Ssl    0:00 /usr/libexec/gnome-session-binary --systemd-service --session=ubuntu
      16387 ?        Ssl    0:40 /usr/bin/gnome-shell
      16409 ?        Sl     0:00 ibus-daemon --panel disable --xim
      16413 ?        Sl     0:00 /usr/libexec/ibus-dconf
      16414 ?        Sl     0:02 /usr/libexec/ibus-extension-gtk3
      16416 ?        Sl     0:00 /usr/libexec/ibus-x11 --kill-daemon
      16421 ?        Sl     0:00 /usr/libexec/ibus-portal
      16428 ?        Sl     0:00 /usr/libexec/dconf-service
      16435 ?        Sl     0:00 /usr/libexec/at-spi2-registryd --use-gnome-session
      16439 ?        Ssl    0:00 /usr/libexec/xdg-permission-store
      16444 ?        Sl     0:00 /usr/libexec/gnome-shell-calendar-server
      16448 ?        Ssl    0:00 /usr/libexec/evolution-source-registry
      16473 ?        Sl     0:00 /usr/bin/gjs /usr/share/gnome-shell/org.gnome.Shell.Notifications
      16481 ?        Sl     0:00 /usr/libexec/gvfsd-trash --spawner :1.3 /org/gtk/gvfs/exec_spaw/0
      16492 ?        Ssl    0:00 /usr/libexec/evolution-calendar-factory
      16494 ?        Ssl    0:00 /usr/libexec/gsd-a11y-settings
      16495 ?        Ssl    0:00 /usr/libexec/gsd-color
      16499 ?        Ssl    0:00 /usr/libexec/gsd-datetime
      16500 ?        Ssl    0:01 /usr/libexec/gsd-housekeeping
      16501 ?        Ssl    0:00 /usr/libexec/gsd-keyboard
      16502 ?        Ssl    0:00 /usr/libexec/gsd-media-keys
      16506 ?        Ssl    0:00 /usr/libexec/gsd-power
      16509 ?        Ssl    0:00 /usr/libexec/gsd-print-notifications
      16511 ?        Ssl    0:00 /usr/libexec/gsd-rfkill
      16512 ?        Ssl    0:00 /usr/libexec/gsd-screensaver-proxy
      16518 ?        Ssl    0:01 /usr/libexec/gsd-sharing
      16519 ?        Ssl    0:00 /usr/libexec/gsd-smartcard
      16520 ?        Ssl    0:00 /usr/libexec/gsd-sound
      16521 ?        Ssl    0:00 /usr/libexec/gsd-usb-protection
      16530 ?        Ssl    0:00 /usr/libexec/gsd-wacom
      16541 ?        Ssl    0:00 /usr/libexec/gsd-wwan
      16544 ?        Ssl    0:00 /usr/libexec/gsd-xsettings
      16563 ?        Sl     0:00 /usr/libexec/gsd-disk-utility-notify
      16580 ?        Sl     0:00 /usr/libexec/evolution-data-server/evolution-alarm-notify
      16584 ?        Sl     0:00 /usr/libexec/gsd-printer
      16647 ?        Ssl    0:00 /usr/libexec/evolution-addressbook-factory
      16654 ?        Sl     0:12 /snap/snap-store/467/usr/bin/snap-store --gapplication-service
      16685 ?        Ssl    0:00 /usr/libexec/xdg-document-portal
      16729 ?        Sl     0:00 /usr/libexec/ibus-engine-simple
      17194 ?        Sl     0:28 /usr/bin/nautilus --gapplication-service
      17226 ?        Ssl    0:00 /usr/libexec/gvfsd-metadata
      17402 ?        Sl     0:00 /usr/lib/ibus/ibus-engine-libpinyin --ibus
      17946 ?        Sl     0:00 update-notifier
      19544 ?        Ssl    0:02 /usr/libexec/gnome-terminal-server
      19552 pts/2    Ss+    0:00 bash
      19748 ?        Ssl    0:00 /usr/libexec/tracker-store
      20832 ?        S      0:00 sshd: hc@pts/3
      20833 pts/3    Ss+    0:00 -bash
      22002 ?        S      0:00 sshd: hc@pts/0
      22003 pts/0    Ss     0:00 -bash
      22064 pts/0    R+     0:00 ps -x
    ```

  - `ps -axu | grep xxx` 过滤得到xxx的信息

    ``` shell
    hc@hc-RV411:~$ ps -axu | grep hc
    root         174  0.0  0.0      0     0 ?        I<   07:41   0:00 [kworker/u9:0-hci0]
    root         430  0.0  0.0      0     0 ?        I<   07:41   0:00 [kworker/u9:1-hci0]
    avahi        805  0.0  0.0   8664  3296 ?        Ss   07:41   0:11 avahi-daemon: running [hc-RV411.local]
    hc          1484  0.0  0.2  19300 10712 ?        Ss   07:43   0:00 /lib/systemd/systemd --user
    hc          1489  0.0  0.0 169280  3276 ?        S    07:43   0:00 (sd-pam)
    hc          1495  0.0  0.4 1754420 18740 ?       Ssl  07:43   0:00 /usr/bin/pulseaudio --daemonize=no --log-target=journal
    hc          1497  0.0  0.5 594872 22108 ?        SNsl 07:43   0:00 /usr/libexec/tracker-miner-fs
    hc          1501  0.0  0.1   8848  5860 ?        Ss   07:43   0:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
    hc          1536  0.0  0.2 249372  7988 ?        Ssl  07:43   0:00 /usr/libexec/gvfsd
    hc          1541  0.0  0.1 378336  6392 ?        Sl   07:43   0:00 /usr/libexec/gvfsd-fuse /run/user/1000/gvfs -f -o big_writes
    hc          1553  0.0  0.2 397428 10484 ?        Ssl  07:43   0:03 /usr/libexec/gvfs-udisks2-volume-monitor
    hc          1568  0.0  0.1 245356  6132 ?        Ssl  07:43   0:00 /usr/libexec/gvfs-mtp-volume-monitor
    hc          1579  0.0  0.1 245532  6252 ?        Ssl  07:43   0:00 /usr/libexec/gvfs-goa-volume-monitor
    hc          1583  0.0  1.5 610376 61036 ?        Sl   07:43   0:00 /usr/libexec/goa-daemon
    hc          1643  0.0  0.2 324412  8712 ?        Sl   07:43   0:00 /usr/libexec/goa-identity-service
    hc          1668  0.0  0.1 247776  6684 ?        Ssl  07:43   0:00 /usr/libexec/gvfs-gphoto2-volume-monitor
    hc          1674  0.0  0.2 326384  9084 ?        Ssl  07:43   0:00 /usr/libexec/gvfs-afc-volume-monitor
    hc         16250  0.0  0.1 249812  7592 ?        Sl   14:17   0:00 /usr/bin/gnome-keyring-daemon --daemonize --login
    hc         16254  0.0  0.1 173660  6920 tty2     Ssl+ 14:17   0:00 /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
    hc         16263  0.0  0.3 198064 14280 tty2     Sl+  14:17   0:00 /usr/libexec/gnome-session-binary --systemd --systemd --session=ubuntu
    hc         16330  0.0  0.0   6032   456 ?        Ss   14:17   0:00 /usr/bin/ssh-agent /usr/bin/im-launch env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
    hc         16339  0.0  0.0      0     0 tty2     Z+   14:17   0:00 [fcitx] <defunct>
    hc         16341  0.0  1.0 135752 41908 ?        S    14:17   0:00 /usr/bin/fcitx -d
    hc         16348  0.0  0.0   7216  3100 ?        Ss   14:17   0:00 /usr/bin/dbus-daemon --syslog --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
    hc         16352  0.0  0.0   5372   208 ?        SN   14:17   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-0CBqBI8aNz,guid=861c0b1182f8f0e2d9c20f105ef584ec 16348
    hc         16353  0.0  0.1 305416  6764 ?        Ssl  14:17   0:00 /usr/libexec/at-spi-bus-launcher
    hc         16358  0.0  0.1   7216  4100 ?        S    14:17   0:00 /usr/bin/dbus-daemon --config-file=/usr/share/defaults/at-spi2/accessibility.conf --nofork --print-address 3
    hc         16366  0.0  0.1  99704  4280 ?        Ssl  14:17   0:00 /usr/libexec/gnome-session-ctl --monitor
    hc         16373  0.0  0.4 493968 16224 ?        Ssl  14:17   0:00 /usr/libexec/gnome-session-binary --systemd-service --session=ubuntu
    hc         16387  0.1  7.5 3976120 294048 ?      Ssl  14:17   0:40 /usr/bin/gnome-shell
    hc         16409  0.0  0.2 320600  8532 ?        Sl   14:17   0:00 ibus-daemon --panel disable --xim
    hc         16413  0.0  0.1 246188  7396 ?        Sl   14:17   0:00 /usr/libexec/ibus-dconf
    hc         16414  0.0  0.8 285312 32052 ?        Sl   14:17   0:02 /usr/libexec/ibus-extension-gtk3
    hc         16416  0.0  0.7 207500 28508 ?        Sl   14:17   0:00 /usr/libexec/ibus-x11 --kill-daemon
    hc         16421  0.0  0.1 246028  6608 ?        Sl   14:17   0:00 /usr/libexec/ibus-portal
    hc         16428  0.0  0.1 156356  5884 ?        Sl   14:17   0:00 /usr/libexec/dconf-service
    hc         16435  0.0  0.1 162884  6640 ?        Sl   14:17   0:00 /usr/libexec/at-spi2-registryd --use-gnome-session
    hc         16439  0.0  0.1 245252  4804 ?        Ssl  14:17   0:00 /usr/libexec/xdg-permission-store
    hc         16444  0.0  0.4 507232 17140 ?        Sl   14:17   0:00 /usr/libexec/gnome-shell-calendar-server
    hc         16448  0.0  0.5 817664 23168 ?        Ssl  14:17   0:00 /usr/libexec/evolution-source-registry
    hc         16473  0.0  0.6 2743332 24696 ?       Sl   14:17   0:00 /usr/bin/gjs /usr/share/gnome-shell/org.gnome.Shell.Notifications
    hc         16481  0.0  0.2 323484  8176 ?        Sl   14:17   0:00 /usr/libexec/gvfsd-trash --spawner :1.3 /org/gtk/gvfs/exec_spaw/0
    hc         16492  0.0  0.7 848308 27408 ?        Ssl  14:17   0:00 /usr/libexec/evolution-calendar-factory
    hc         16494  0.0  0.1 319320  6736 ?        Ssl  14:17   0:00 /usr/libexec/gsd-a11y-settings
    hc         16495  0.0  0.7 588228 30844 ?        Ssl  14:17   0:00 /usr/libexec/gsd-color
    hc         16499  0.0  0.3 383248 14244 ?        Ssl  14:17   0:00 /usr/libexec/gsd-datetime
    hc         16500  0.0  0.2 321384  7884 ?        Ssl  14:17   0:01 /usr/libexec/gsd-housekeeping
    hc         16501  0.0  0.7 355472 28808 ?        Ssl  14:17   0:00 /usr/libexec/gsd-keyboard
    hc         16502  0.0  0.8 697832 32072 ?        Ssl  14:17   0:00 /usr/libexec/gsd-media-keys
    hc         16506  0.0  0.7 429924 29844 ?        Ssl  14:17   0:00 /usr/libexec/gsd-power
    hc         16509  0.0  0.2 257876 10732 ?        Ssl  14:17   0:00 /usr/libexec/gsd-print-notifications
    hc         16511  0.0  0.1 466752  6316 ?        Ssl  14:17   0:00 /usr/libexec/gsd-rfkill
    hc         16512  0.0  0.1 245164  5996 ?        Ssl  14:17   0:00 /usr/libexec/gsd-screensaver-proxy
    hc         16518  0.0  0.2 474448  9676 ?        Ssl  14:17   0:01 /usr/libexec/gsd-sharing
    hc         16519  0.0  0.2 324688  8624 ?        Ssl  14:17   0:00 /usr/libexec/gsd-smartcard
    hc         16520  0.0  0.2 328908  9360 ?        Ssl  14:17   0:00 /usr/libexec/gsd-sound
    hc         16521  0.0  0.1 394624  7568 ?        Ssl  14:17   0:00 /usr/libexec/gsd-usb-protection
    hc         16530  0.0  0.7 354972 28484 ?        Ssl  14:17   0:00 /usr/libexec/gsd-wacom
    hc         16541  0.0  0.2 323644  8288 ?        Ssl  14:17   0:00 /usr/libexec/gsd-wwan
    hc         16544  0.0  0.7 356356 30136 ?        Ssl  14:17   0:00 /usr/libexec/gsd-xsettings
    hc         16563  0.0  0.1 231792  5616 ?        Sl   14:17   0:00 /usr/libexec/gsd-disk-utility-notify
    hc         16580  0.0  2.1 699160 81848 ?        Sl   14:17   0:00 /usr/libexec/evolution-data-server/evolution-alarm-notify
    hc         16584  0.0  0.3 351816 14752 ?        Sl   14:17   0:00 /usr/libexec/gsd-printer
    hc         16647  0.0  0.6 682844 26516 ?        Ssl  14:17   0:00 /usr/libexec/evolution-addressbook-factory
    hc         16654  0.0  7.4 1266532 288912 ?      Sl   14:17   0:12 /snap/snap-store/467/usr/bin/snap-store --gapplication-service
    hc         16685  0.0  0.1 467076  6844 ?        Ssl  14:17   0:00 /usr/libexec/xdg-document-portal
    hc         16729  0.0  0.1 172348  7456 ?        Sl   14:17   0:00 /usr/libexec/ibus-engine-simple
    hc         17194  0.1  2.2 1381912 89184 ?       Sl   14:17   0:28 /usr/bin/nautilus --gapplication-service
    hc         17226  0.0  0.1 171968  6636 ?        Ssl  14:17   0:00 /usr/libexec/gvfsd-metadata
    hc         17402  0.0  0.2 254460 10772 ?        Sl   14:18   0:00 /usr/lib/ibus/ibus-engine-libpinyin --ibus
    hc         17946  0.0  0.8 431504 34688 ?        Sl   14:18   0:00 update-notifier
    hc         19544  0.0  1.3 860012 53260 ?        Ssl  14:20   0:02 /usr/libexec/gnome-terminal-server
    hc         19552  0.0  0.1  20540  5580 pts/2    Ss+  14:20   0:00 bash
    hc         19748  0.0  0.6 444300 26256 ?        Ssl  14:24   0:00 /usr/libexec/tracker-store
    root       20011  0.0  0.0  19416  3024 ?        Ss   14:30   0:05 /sbin/mount.ntfs /dev/sdc1 /media/hc/583211C03211A452 -o rw,nodev,nosuid,windows_names,uid=1000,gid=1000,uhelper=udisks2
    root       20700  0.0  0.2  13984  9136 ?        Ss   19:42   0:00 sshd: hc [priv]
    hc         20832  0.0  0.1  13984  6100 ?        S    19:42   0:00 sshd: hc@pts/3
    hc         20833  0.0  0.1  20528  5420 pts/3    Ss+  19:42   0:00 -bash
    root       21866  0.0  0.2  13988  9036 ?        Ss   21:24   0:00 sshd: hc [priv]
    hc         22002  0.0  0.1  13988  6272 ?        S    21:24   0:00 sshd: hc@pts/0
    hc         22003  0.0  0.1  20528  5476 pts/0    Ss   21:24   0:00 -bash
    hc         22067  0.0  0.0  21140  3656 pts/0    R+   21:36   0:00 ps -axu
    hc         22068  0.0  0.0  18696   736 pts/0    S+   21:36   0:00 grep --color=auto hc
    
    ```

    

  - `ps -ef`以全格式查看当前所有的进程，查看进程的父进程 

  - `-e` 显示所有进程

  - `-f`全格式
  
    ``` shell 
    hc@hc-RV411:~$ ps -ef 
    UID          PID    PPID  C STIME TTY          TIME CMD
    root           1       0  0 09:29 ?        00:00:03 /sbin/init splash
    root           2       0  0 09:29 ?        00:00:00 [kthreadd]
    root           3       2  0 09:29 ?        00:00:00 [rcu_gp]
    root           4       2  0 09:29 ?        00:00:00 [rcu_par_gp]
    root           5       2  0 09:29 ?        00:00:00 [kworker/0:0-events]
    root           6       2  0 09:29 ?        00:00:00 [kworker/0:0H-kblockd]
    root           8       2  0 09:29 ?        00:00:00 [mm_percpu_wq]
    ```
  
    <u>PPID：父进程</u>

### 终止进程

- `kill [选项] 进程识别号` 通过进程号来杀死进程

- `killall 进程名称` 通过进程名称杀死进程，也支持通配符。<u>这在系统因负载过大变得很慢时很有用</u>

- `kill -9` 表示强迫进程立刻终止

- 案例1：踢掉非法用户：kill 进程号

  ``` shell
  hc@hc-RV411:~$ ps -aux | grep sshd
  root        1026  0.0  0.1  12160  7468 ?        Ss   09:29   0:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
  root        2044  0.0  0.2  13984  8968 ?        Ss   09:39   0:00 sshd: hc [priv]
  hc          2242  0.0  0.1  13984  6112 ?        S    09:39   0:00 sshd: hc@pts/0
  root        2359  0.1  0.2  13984  9088 ?        Ss   10:02   0:00 sshd: tom [priv]
  tom         2485  0.0  0.1  13984  6164 ?        S    10:02   0:00 sshd: tom@pts/1
  hc          2530  0.0  0.0  18696   656 pts/0    S+   10:02   0:00 grep --color=auto sshd
  hc@hc-RV411:~$ kill 2485
  -bash: kill: (2485) - Operation not permitted
  hc@hc-RV411:~$ su
  Password: 
  root@hc-RV411:/home/hc# kill 2485
  root@hc-RV411:/home/hc# 
  ```

- 案例2：终止远程登录服务`sshd`，在适当时候再次重启`sshd`服务

  ``` shell
  kill 1026
  ```

- 案例3：终止多个`gedit`编辑器：`killall` 进程名称

  通过进程名称，把属于该进程杀掉  `killall gedit`

- 案例4：强制杀掉一个终端：kill -9 进程号

  ​	***杀掉一个系统默认为比较重要的进程时，必须使用-9.***

### 查看进程树

 - `pstree -p` :显示进程的PID

   ``` shell
   hc@hc-RV411:~$ pstree -p
   systemd(1)─┬─ModemManager(921)─┬─{ModemManager}(941)
              │                   └─{ModemManager}(945)
              ├─NetworkManager(814)─┬─{NetworkManager}(862)
              │                     └─{NetworkManager}(907)
              ├─accounts-daemon(801)─┬─{accounts-daemon}(808)
              │                      └─{accounts-daemon}(905)
   
   ```

   

 - `pstree -u`: 显示进程的所属用户

   ``` shell
   hc@hc-RV411:~$ pstree -u
   systemd─┬─ModemManager───2*[{ModemManager}]
           ├─NetworkManager───2*[{NetworkManager}]
           ├─accounts-daemon───2*[{accounts-daemon}]
           ├─acpid
           ├─avahi-daemon(avahi)───avahi-daemon
           ├─bluetoothd
           ├─colord(colord)───2*[{colord}]
           ├─cron
           ├─cups-browsed───2*[{cups-browsed}]
           ├─cupsd
           ├─dbus-daemon(messagebus)
           ├─dbus-daemon(hc)
           ├─fcitx(hc)
           ├─fcitx-dbus-watc(hc)
           ├─gdm3─┬─gdm-session-wor─┬─gdm-x-session(gdm)─┬─Xorg(root)───{Xorg}
           │      │                 │                    ├─gnome-session-b───3*[{gnome-session-b}]
           │      │                 │                    └─2*[{gdm-x-session}]
           │      │                 └─2*[{gdm-session-wor}]
           │      ├─gdm-session-wor─┬─gdm-session-wor───2*[{gdm-session-wor}]
           │      │                 ├─gdm-x-session(hc)─┬─Xorg(root)───{Xorg}
           │      │                 │                   ├─gnome-session-b─┬─fcitx
           │      │                 │                   │                 ├─ssh-agent
           │      │                 │                   │                 └─2*[{gnome-session-b}]
           │      │                 │                   └─2*[{gdm-x-session}]
           │      │                 └─2*[{gdm-session-wor}]
           │      └─2*[{gdm3}]
           ├─gnome-keyring-d(hc)───3*[{gnome-keyring-d}]
   ```




### 服务（service）管理

- service管理指令：service 服务名 [start | stop | restart | reload | status]
- 在CentOS7.0之后，不再使用service，而是systemctl
- 查看防火墙情况：
  - service iptables status
  - systemctl status firewalld（7.0之后的版本）
- 测试某个端口是否在监听：telnet
- 查看服务名：
  - 方式1：使用setup->系统服务就可以看到
  - 方式2：`/etc/init.d/`服务名称  ***比较常用***
- 服务的运行级别（`runlevel`）：对应开机的7个运行级别
  - 查看或修改默认级别：`vim /etc/inittab`
    - 每个服务对应的每个运行级别都可以设置
- 如果不小心将默认的运行级别设置成0或者6，怎么处理？
  - 进入单用户模式，修改成正常的即可。
- chkconfig：可以给每个服务的各个运行级别设置自启动/关闭
- 查看xxx服务：chkconfig –list | grep xxx
- 查看服务的状态：chkconfig 服务名 --list
- 给服务的运行级别设置自启动：chkconfig –level 5 服务名 on/off
- 要所有运行级别关闭或开启：chkconfig 服务名 on/off

### 动态监控进程

- top [选项]
- top和ps命令很相似。它们都用来显示正在执行的进程。top和ps最大的不同之处在于top在执行一段时间可以更新正在运行的进程。
- `-d` 秒数：指定top命令每隔几秒更新。默认是3秒。
- `-i`：使top不显示任何闲置或者僵死进程。
- `-p`：通过指定监控进程ID来仅仅监控某个进程的状态。
  - 案例1：监控特定用户：top查看进程；u输入用户名。	
  - 案例2：终止指定的进程：top查看进程；k输入要结束的进程。
  - 案例3：指定系统状态更新的时间（每隔10秒自动更新，默认是3秒）：top -d 10
- 交互操作说明：
  - P：以CPU使用率排序，默认就是此项
  - M：以内存的使用率排序
  - N：以PID排序
  - q：退出top

- 监控网络状态

  - netstat [选项]

  - -an：按一定顺序排列输出

  - -p：显示哪个进程在调用

    

## RPM和YUM

### RPM

 - 介绍

   	- 一种互联网下载包的打包及安装工具，它包含在某些Linux分发版中。它生成具有.rpm扩展名的文件。RPM时RedHat PackageManager的缩写。类似于windows的setup.exe。这一文件格式虽然有redhat的标志，但是理论上是通用的。

- 简单的查询指令

  - 查询已安装的rpm指令 `rpm -qa | grep firefox`

    ``` shell
    [hc@localhost ~]$ rpm -qa | grep firefox
    firefox-68.9.0-1.el7.centos.x86_64
    
    ```

- rpm包的其它查询指令：

  - `rpm -qa`：查询所安装的所有rpm软件包

  - `rpm -qa | more` 分页显示所有安装的rpm软件包

  - `rpm -qa | grep xx` 过滤显示xx的rpm软件包

  - `rpm -q xx`：查询xx软件包是否安装

  - `rpm -qi xx`：查询软件包信息

    ``` shell
    [hc@localhost ~]$ rpm -qi firefox
    Name        : firefox
    Version     : 68.9.0
    Release     : 1.el7.centos
    Architecture: x86_64
    Install Date: Tue 23 Jun 2020 09:21:35 AM EDT
    Group       : Unspecified
    Size        : 240980099
    License     : MPLv1.1 or GPLv2+ or LGPLv2+
    Signature   : RSA/SHA256, Thu 04 Jun 2020 10:06:58 AM EDT, Key ID 24c6a8a7f4a80eb5
    Source RPM  : firefox-68.9.0-1.el7.centos.src.rpm
    Build Date  : Thu 04 Jun 2020 05:03:09 AM EDT
    Build Host  : x86-02.bsys.centos.org
    Relocations : (not relocatable)
    Packager    : CentOS BuildSystem <http://bugs.centos.org>
    Vendor      : CentOS
    URL         : https://www.mozilla.org/firefox/
    Summary     : Mozilla Firefox Web browser
    Description :
    Mozilla Firefox is an open-source web browser, designed for standards
    compliance, performance and portability.
    ```

    

  - `rpm -ql xx`：查询软件包中的文件

    ``` shell
    [hc@localhost ~]$ rpm -ql firefox
    /etc/firefox
    /etc/firefox/pref
    /usr/bin/firefox
    /usr/lib64/firefox
    /usr/lib64/firefox/LICENSE
    /usr/lib64/firefox/application.ini
    /usr/lib64/firefox/browser/blocklist.xml
    ```

    

  - `rpm -qf `文件全路径名：查询文件所属的软件包  (反向查询)

    ``` shell
    [hc@localhost ~]$ rpm -qf /etc/passwd
    setup-2.8.71-11.el7.noarch
    ```

    

- 卸载rpm包：`rpm -e 软件包名称`

- 删除时可能会发生依赖错误，忽视依赖强制删除的方法：`rpm -e --nodeps 软件包名称`

- 安装rpm包：`rpm -ivh 软件包全路径名称`

  - `i=install`：安装
  - `v=verbose`：提示
  - `h=hash`：进度条

### YUM

- YUM：是一个shell前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并安装，可以**自动处理依赖性关系**，并且一次安装所有依赖的软件包。使用yum的前提是联网。
- yum list | grep xx：查询yum服务器是否有需要安装的软件
- yum install xx：安装指定的yum包
- yum -y remove xx：卸载指定的yum包