Linux 学习笔记

## 基本介绍

略

## 文件系统目录结构
### linux目录特点
- linux的目录中只有一个主目录
- linux是以文件的形式管理设备，一切皆为文件

### 树形结构（/）

  - /bin：是Binary的缩写，这个目录中存放着经常使用的目录。

  - /sbin：s是Super user的缩写，这里存放着系统管理员使用的管理程序。

  - /home：存放普通用户的主目录，在Linux中每个用户都有一个自己的目录，一般该目录名是以帐号命名的。

  - /root：该目录为系统管理员，也称为超级权限者的用户主目录。

  - /lib：系统开机所需要最基本的动态链接共享库，其作用类似与windows中的dll文件。几乎所有的应用程序都需要用到这些共享库。

  - /lost+found：这个目录一般情况下是空的，当系统非法关机后，这里存放一些文件。

  - /etc：所有的系统管理所需要的配置文件和子目录。

  - /usr：非常重要的目录，用户的很多应用程序和文件都存放在这一目录下，类似与windows的program files目录。

  - /boot：存放启动linux需要的一些核心文件，包括一些连接文件和镜像文件。

  - /proc：这个目录是一个虚拟的目录。它是系统内存的映射，访问这个目录来获取系统信息。

  - /srv：service的缩写，该目录存放一些服务启动之后需要提供的数据。

  - /sys：linux2.6内核的一个很大的变化，该目录下安装了2.6内核中新出现的一个文件系统sysfs。（ubuntu20.04中没有）

  - /tmp：这个目录是用来存放一些临时文件的

  - /dev：类似有windows的设备管理器，把所有的硬件用文件的形式存储。

  - /media：linux系统会自动设别一些设备，例如U盘光驱等等，当识别后，linux会把识别的设备挂载到这个目录下。

  - /mnt：系统提供该目录是为了让用户临时挂在别的文件系统的，我们可以将外部的存储挂载到/mnt/上，然后就可以进入该目录查看里面的内容。

  - /opt：这是给主机额外的安装软件所摆放的目录，如ORACLE数据库就放在此文件中，默认为空。

  - /usr/local：这里另一个给主机额外安装软件所设置的目录，一般通过编译源码的方式安装的程序。

  - /var：存放着不断扩充着的东西，习惯经常被修改的目录放在这个目录中，包括各种日志文件。

  - /selinux：是一种安全子系统，它能控制程序只能访问特定文件。 

    -------------

    

## 远程登录和文件传输

- 远程登录：Xshell
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

  - 设置文件的行号，在命令行下，输入__set nu__ 和 __set nonu__（命令行模式）

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

### 常用命令：

  - 添加用户：

    - `useradd [选项] 用户名`

      - 文件选项 `-d 指定目录 用户名`

    - 当创建成功用户后，会自动创建用户的home/用户名目录。__（ubuntu20.04 不可）__

      > `useradd xm` *系统并没有自动创建home/xm目录，仅仅创建了用户*
      >
      > `useradd -d /home/xm1 xm1` *系统创建用户，但并未创建/home/xm1目录*
      >
      > `useradd -m xm2` *系统自动创建用户，并创建/home/xm2目录*
      >
      > `useradd -d /home/xm3 -m xm3` *系统自动创建xm3用户，并将用户的/home/xm3目录给用户链接上*

    - 创建账户之后修改账户的登录密码`passwd 用户名`

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

  - 当我们对某个指令不熟悉的时候，可以使用linux的帮助指令来了解指令的使用方法

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
    	  	- 
    - `mkdir [选项] 要创建目录`
    
        - `-p`  创建多级目录 确保文件目录存在，不存在就创建一个，但是直接使用mkdir来创建的话，多级目录会报错。`mkdir test/test1`报错，另外，创建文件的时候不要在test的前面加上`/`否则会变成隐藏文件。
    
    - `rmdir [选项] 要删除的目录`
    
        -  删除多级目录。
        - 另外如果文件夹中有文件的话，`rmdir`是无法删除的，此时必须要使用`rm -rf` 命令。
    
    - `touch` 用来修改文件或目录的时间属性，包括存取时间和更改时间，如果文件目录不存在，就创建一个新的文件。
    
        - ```linux
            touch [-acfm][-d<日期时间>][-r<参考文件或目录>] [-t<日期时间>][--help][--version][文件或目录…]
            
            ```
    
        - <u>创建一个空文件，类似于windows下的新建一个空文件,可以一次性创建多个文件</u>
    
    - `cp`  主要用于复制文件和目录
    
        - ```linux
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
    
            ```linux
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

```
- `cat`查看文件内容，以只读的方式

    ```-
    hc@hc-RV411:~$ cat -n /etc/profile |more
    ```

- `more` 是一个基于VI编辑器的文本过滤器，它以全屏幕的方式按页显示文本文件的内容。more指令中内置了若干快捷键，详见操作说明。

- `less` 用来分屏查看文件内容，功能与more指令类似，但是比more指令更加强大，支持各种显示终端。less指令在显示文件时，并不是将整个文件一次将整个文件加载之后才显示，而是根据显示需要加载内容，对于显示大型问家具有较高的效率。

    - `enter`向下一行，`space` 向下一页

- `>` he`>>`

    - `>`  输出重定向  会将原来的内容覆盖掉

    - `>>`追加 不会覆盖原来的内容，会追加在文件末尾

    - 实例

        - ```
            hc@hc-RV411:~$ touch info.txt       
            hc@hc-RV411:~$ ls -l > info.txt
            ```

        - ```
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

  ```
  hc@hc-RV411:~$ echo $JAVA_HOME
  /opt/jdk1.8.0_251
  hc@hc-RV411:~$ echo "hello world"
  hello world
  ```

  

- `head`指令 用于显示文件的开头部分内容，默认情况下head指令显示文件的前10行内容

  ```
  hc@hc-RV411:~$ head -n 5 /etc/profile
  # /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
  
  if [ "${PS1-}" ]; then
    if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
  
  ```

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

​	