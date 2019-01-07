#!/bin/bash

cd /www/web

tar -czf /backup/code/ah_com_$(date +%Y-%m-%d).tar.gz ah_com/

find /backup/code/ -ctime +7 -delete
