#!/bin/bash
#backup database from remote server

rsync -vzrtog --progress  -e "ssh -p 1119" root@1.2.3.4:/backup/mysql/mysql-backup_$(date +%Y-%m-%d).tar.gz /backup/mysql
