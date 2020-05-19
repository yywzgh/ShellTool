path C:\Program Files\MySQL\MySQL Server 5.7\bin;%path%

path D:\Program Files\7-Zip;%path%


rem 测试环境备份

set test_file_name=%date:~6,4%-%date:~0,2%-%date:~3,2%_test_backup

mysqldump.exe --host=10.10.10.10 --port=3306 --user=root --password=12346 --default-character-set=utf8 --set-gtid-purged=OFF --log-error=e:/backup/test/error.log --skip-lock-tables  taobao_online > e:/backup/test/%test_file_name%.sql

7z.exe a -tzip "E:\backup\test\%test_file_name%.zip" "E:\backup\test\%test_file_name%.sql"

del E:\backup\test\*.sql

for %%i in ("E:\backup\test\%test_file_name%.zip") do (
	set test_backup_size=%%~zi
)

if %test_backup_size% lss 5120 (
	curl -H "Content-Type:application/json" -X POST -d "{\"msgtype\": \"text\", \"text\": {\"content\": \"测试环境-数据库备份失败！\"}, \"at\": {\"atMobiles\": [\"19696193138\", \"13971241882\"],\"isAtAll\": false}}" https://oapi.dingtalk.com/robot/send?access_token=0aedf65ec0ef879947afff8d55f92c26e928d9239b07b7a1b08c02f84891a66b
)


rem 生产环境备份

echo online backup start at %date:~6,4%-%date:~0,2%-%date:~3,2% %time%

set online_file_name=%date:~6,4%-%date:~0,2%-%date:~3,2%_online_backup

mysqldump.exe --host=10.10.10.10 --port=3337 --user=root --password=12346 --default-character-set=utf8 --set-gtid-purged=OFF --log-error=e:/backup/online/error.log --skip-lock-tables  taobao_online > e:/backup/online/%online_file_name%.sql

7z.exe a -tzip "E:\backup\online\%online_file_name%.zip" "E:\backup\online\%online_file_name%.sql"

del E:\backup\online\*.sql


for %%i in ("E:\backup\test\%online_file_name%.zip") do (
	set online_backup_size=%%~zi
)

if %test_backup_size% lss 5120 (
	curl -H "Content-Type:application/json" -X POST -d "{\"msgtype\": \"text\", \"text\": {\"content\": \"测试环境-数据库备份失败！\"}, \"at\": {\"atMobiles\": [\"196000000\", \"139700000\"],\"isAtAll\": false}}" https://oapi.dingtalk.com/robot/send?access_token=11111111111111111111111111
)