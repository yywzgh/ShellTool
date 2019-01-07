#!/bin/bash


PHP_ROOT_PATH="/www/web/pre_bzdhgc_com/tp5"
PHP_MYSQL_HOSTNAME="     'hostname' => 'localhost_123',"
PHP_MYSQL_DB="     'database' => 'aihua_123',"
PHP_MYSQL_USERNAME="     'username' => 'aihua_123',"
PHP_MYSQL_PASSWORD="     'password' => 'a123456_123',"
PHP_MYSQL_PORT="     'hostport'        => '3306_123',"

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
