#!/bin/bash

if [ "$1" != "" ]; then
	echo ""
else
	echo "缺少参数，请检查输入的参数！"
	echo "使用示例：./php_auto_config.sh -m /www/web/pre_aihua_vonework_com -h 主机地址 -d 数据库名 -u 用户名 -p 密码 -P 端口号"
	exit 0
fi

while getopts :m:h:d:u:p:P: OPTION;do
  case $OPTION in
  m)
    echo "web根目录: $OPTARG"
	PHP_ROOT_PATH=$OPTARG
    ;;
  h)
    echo "主机名地址: $OPTARG"
	PHP_MYSQL_HOSTNAME="     'hostname' => '$OPTARG',"
    ;;
  d)
    echo "数据库名: $OPTARG"
	PHP_MYSQL_DB="     'database' => '$OPTARG',"
    ;;
  u)
    echo "用户名: $OPTARG"
	PHP_MYSQL_USERNAME="     'username' => '$OPTARG',"
    ;;
  p)
    echo "密码: $OPTARG"
	PHP_MYSQL_PASSWORD="     'password' => '$OPTARG',"
    ;;
  P)
    echo "端口: $OPTARG"
	PHP_MYSQL_PORT="     'hostport'        => '$OPTARG',"
    ;;
  :)
	echo "选项 -$OPTARG 需要一个参数."
	exit 1
	;;
  ?)
	echo "缺少参数，请检查输入的参数！"
	echo "使用示例：./php_auto_config.sh -h 主机地址 -d 数据库名 -u 用户名 -p 密码 -P 端口号"
	exit 1
	;;
  esac
done

#PHP_MYSQL_HOSTNAME="     'hostname' => 'localhost_123',"
#PHP_MYSQL_DB="     'database' => 'aihua_123',"
#PHP_MYSQL_USERNAME="     'username' => 'aihua_123',"
#PHP_MYSQL_PASSWORD="     'password' => 'a123456_123',"
#PHP_MYSQL_PORT="     'hostport'        => '3306_123',"

#read -t 30 -p "请输入项目根路径:" PHP_ROOT_PATH

if [ ! -d "$PHP_ROOT_PATH" ]; then
  echo "$PHP_ROOT_PATH目录不存在!"
  exit 0
else 
  echo "请输入项目根路径: $PHP_ROOT_PATH"
fi

PHP_ADMIN_PATH=$PHP_ROOT_PATH/app_admin/database.php
PHP_STORE_PATH=$PHP_ROOT_PATH/app_store/database.php
PHP_MP_PATH=$PHP_ROOT_PATH/app_mp/database.php
PHP_PROGRAM_PATH=$PHP_ROOT_PATH/etop_program/config_test.php

function modify_admin_config(){

  cp  $PHP_ADMIN_PATH $PHP_ADMIN_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_ADMIN_PATH

  
  echo "》》》修改 $PHP_ADMIN_PATH 成功"
}

function modify_store_config(){

  cp  $PHP_STORE_PATH $PHP_STORE_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_STORE_PATH
  
  echo "》》》修改 $PHP_STORE_PATH 成功"
}

function modify_mp_config(){
  
  cp  $PHP_MP_PATH $PHP_MP_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_MP_PATH

  echo "》》》修改 $PHP_STORE_PATH 成功"
}

function modify_program_config(){

  cp  $PHP_PROGRAM_PATH $PHP_PROGRAM_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_PROGRAM_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_PROGRAM_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_PROGRAM_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_PROGRAM_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_PROGRAM_PATH
  
  echo "》》》修改 $PHP_PROGRAM_PATH 成功"
}

if [ ! -f "$PHP_ADMIN_PATH" ]; then
  echo "**** 配置文件$PHP_ADMIN_PATH不存,未做处理! ****"
else
  modify_admin_config
fi


if [ ! -f "$PHP_STORE_PATH" ]; then
  echo "**** 配置文件$PHP_STORE_PATH不存,未做处理! ****"
else
  modify_store_config
fi


if [ ! -f "$PHP_MP_PATH" ]; then
  echo "**** 配置文件$PHP_MP_PATH不存,未做处理! ****"
else
  modify_mp_config
fi


if [ ! -f "$PHP_PROGRAM_PATH" ]; then
  echo "**** 配置文件$PHP_MP_PATH不存,未做处理! ****"
else
  modify_program_config
fi
