#!/bin/bash

list='product_new product_pre'
base_dir='/backup/mysql/'
backup_dir=$base_dir$(date +%Y-%m-%d)

if [ ! -d "$backup_dir" ]; then
        mkdir "$backup_dir"
fi

for db in $list; do
        /www/wdlinux/mysql-5.5.58/bin/mysqldump -uroot -p11111111 --default-character-set=utf8 --log-error=$backup_dir/$db-error.log --routines --triggers --events --hex-blob -x --databases $db > $backup_dir/$db.sql
done

cd $base_dir

tar -czf mysql-backup_$(date +%Y-%m-%d).tar.gz $(date +%Y-%m-%d)

find /backup/mysql/ -ctime +7 -delete

