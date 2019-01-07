#!/bin/bash

#用于修改php数据库配置文件

PHP_ROOT_PATH="/tmp/pre_bzdhgc_com/tp5"
PHP_MYSQL_HOSTNAME="     'hostname' => 'localhost_123',"
PHP_MYSQL_DB="     'database' => 'aihua_123',"
PHP_MYSQL_USERNAME="     'username' => 'aihua_123',"
PHP_MYSQL_PASSWORD="     'password' => 'a123456_123',"
PHP_MYSQL_PORT="     'hostport'        => '3306_123',"

if [ ! -d "$PHP_ROOT_PATH" ]; then
  echo "$PHP_ROOT_PATH目录不存在!"
  exit 0
else 
  echo "请输入项目根路径: $PHP_ROOT_PATH"
fi

PHP_ADMIN_PATH=$PHP_ROOT_PATH/app_admin/database.php
PHP_STORE_PATH=$PHP_ROOT_PATH/app_store/database.php
PHP_MP_PATH=$PHP_ROOT_PATH/app_mp/database.php
PHP_PROGRAM_PATH=$PHP_ROOT_PATH/etop_program/config.php

PHP_ADMIN_CONFIG_PATH=$PHP_ROOT_PATH/app_admin/config.php
PHP_STORE_CONFIG_PATH=$PHP_ROOT_PATH/app_store/config.php
PHP_MP_CONFIG_PATH=$PHP_ROOT_PATH/app_mp/config.php
PHP_PROGRAM_CONFIG_PATH=$PHP_ROOT_PATH/etop_program/config.php

function modify_admin_config(){

  #查询配置文件配置
  APP_STATUS=`cat $PHP_ROOT_PATH/app_admin/config.php | grep app_status | awk -F "'"  '{print $4}'`

  CONFIG_FILE=$PHP_ROOT_PATH/app_admin/$APP_STATUS.php
  
  cp $CONFIG_FILE $CONFIG_FILE.$(date +%Y%m%d%M%S)
  #修改config文件
  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $CONFIG_FILE
  
  echo "》》》修改 $CONFIG_FILE 成功"
  
  cp  $PHP_ADMIN_PATH $PHP_ADMIN_PATH.$(date +%Y%m%d%M%S)
  #修改database文件
  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_ADMIN_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_ADMIN_PATH

  
  echo "》》》修改 $PHP_ADMIN_PATH 成功"
}

function modify_store_config(){

  #查询配置文件配置
  APP_STATUS=`cat $PHP_ROOT_PATH/app_store/config.php | grep app_status | awk -F "'"  '{print $4}'`

  CONFIG_FILE=$PHP_ROOT_PATH/app_store/$APP_STATUS.php
  
  cp $CONFIG_FILE $CONFIG_FILE.$(date +%Y%m%d%M%S)
  #修改config文件
  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $CONFIG_FILE

  echo "》》》修改 $CONFIG_FILE 成功"

  cp $PHP_STORE_PATH $PHP_STORE_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_STORE_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_STORE_PATH
  
  echo "》》》修改 $PHP_STORE_PATH 成功"
}

function modify_mp_config(){
  
    #查询配置文件配置
  APP_STATUS=`cat $PHP_ROOT_PATH/app_mp/config.php | grep app_status | awk -F "'"  '{print $4}'`

  CONFIG_FILE=$PHP_ROOT_PATH/app_mp/$APP_STATUS.php
  
  cp $CONFIG_FILE $CONFIG_FILE.$(date +%Y%m%d%M%S)
  
  #修改config文件
  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $CONFIG_FILE
  
  echo "》》》修改 $CONFIG_FILE 成功"
  
  cp $PHP_MP_PATH $PHP_MP_PATH.$(date +%Y%m%d%M%S)

  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_MP_PATH
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_MP_PATH

  echo "》》》修改 $PHP_STORE_PATH 成功"
}

function modify_program_config(){

  #查询配置文件配置
  APP_STATUS=`cat $PHP_ROOT_PATH/etop_program/config.php | grep app_status | awk -F "'"  '{print $4}'`

  CONFIG_FILE=$PHP_ROOT_PATH/etop_program/$APP_STATUS.php
  
  cp $CONFIG_FILE $CONFIG_FILE.$(date +%Y%m%d%M%S)
  
  #修改config文件
  sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $CONFIG_FILE
  sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $CONFIG_FILE

  echo "》》》修改 $CONFIG_FILE 成功"
  
  #cp  $PHP_PROGRAM_PATH $PHP_PROGRAM_PATH.$(date +%Y%m%d%M%S)

  #sed -i "s/^[[:space:]]*'hostname'.*$/$PHP_MYSQL_HOSTNAME/" $PHP_PROGRAM_PATH
  #sed -i "s/^[[:space:]]*'database'.*$/$PHP_MYSQL_DB/" $PHP_PROGRAM_PATH
  #sed -i "s/^[[:space:]]*'username'.*$/$PHP_MYSQL_USERNAME/" $PHP_PROGRAM_PATH
  #sed -i "s/^[[:space:]]*'password'.*$/$PHP_MYSQL_PASSWORD/" $PHP_PROGRAM_PATH
  #sed -i "s/^[[:space:]]*'hostport'.*$/$PHP_MYSQL_PORT/" $PHP_PROGRAM_PATH
  
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
