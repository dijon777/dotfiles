#!/bin/bash
store_dir=/var/erpad/backup

# バックアップファイルを何日分残しておくか
period='+90'

export BACKUP_DATE=`date +%Y%m%d%H`
export DBBACKUP_FILE="dump${BACKUP_DATE}.sql"

container=development_sixp_db_1

cmd="docker exec -t $container /usr/bin/mysqldump"

echo `date '+%Y-%m-%d %H:%M:%S'` 'mysql backup start.'

## Backup DB File
$cmd --defaults-extra-file=/var/erpad/idpw.conf --default-character-set=utf8 -h 127.0.0.1 erpad > $DBBACKUP_FILE
/usr/bin/gzip $DBBACKUP_FILE
mv ${DBBACKUP_FILE}.gz ${store_dir}/

# 古いバックアップファイルを削除
find ${store_dir} -type f -daystart -mtime $period -exec rm {} \;

echo `date '+%Y-%m-%d %H:%M:%S'` 'done.'
