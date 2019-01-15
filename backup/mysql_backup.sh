#!/bin/bash
#MySQL database backup scripts 

DB_LIST='product_new product_pre'
base_dir='/backup/mysql/'
backup_dir=$base_dir$(date +%Y-%m-%d)

if [ ! -d "$backup_dir" ]; then
        mkdir "$backup_dir"
fi

for db in $DB_LIST; do
        /www/wdlinux/mysql-5.5.58/bin/mysqldump -uroot -p11111111 --default-character-set=utf8 
		 --lock-all-tables --master-date=2 --flush-logs --routines --triggers --events --hex-blob --log-error=$backup_dir/$db-error.log --databases $db > $backup_dir/$db.sql
		 
		 
		#/www/wdlinux/mysql/bin/mysqldump -uroot -p1111111 -hlocalhost c_plus --default-character-set=utf8 -R -E | gzip > /www/web/data_backup/mysql_bak/c_plus_`date +%Y%m%d%H%M%S`.sql.tar.gz
		 
done

cd $base_dir

tar -czf mysql-backup_$(date +%Y-%m-%d).tar.gz $(date +%Y-%m-%d)

rm -rf $backup_dir

find /backup/mysql/ -ctime +7 -delete

