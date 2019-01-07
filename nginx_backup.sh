#!/bin/bash

cd /www/wdlinux

tar -czf /backup/nginx/nginx-backup_$(date +%Y-%m-%d).tar.gz --exclude=nginx-1.8.1/logs  nginx-1.8.1/

find /backup/nginx/ -ctime +7 -delete
