#!/bin/bash

cmd=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $cmd dist_dir" 1>&2
  exit 1
fi

# ディレクトリの最後の/を除去して絶対パスへ変更
dist_dir=`readlink -f ${1%/}`

# バックアップを何日分残しておくか -mmin -mtime
#period='-daystart -mtime +14'
period='-mmin +3'

# 古いバックアップを削除(安全のため20*-*にマッチするものだけ削除)
eval find ${dist_dir} -maxdepth 1 -type d $period -name "20*-*" | xargs rm -fr
