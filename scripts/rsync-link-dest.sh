#!/bin/bash

cmd=`basename $0`
if [ $# -ne 2 ]; then
  echo "Usage: $cmd src_dir dist_dir" 1>&2
  exit 1
fi

# ディレクトリの最後の/を除去して絶対パスへ変更
src_dir=`readlink -f ${1%/}`
dist_dir=`readlink -f ${2%/}`

# 日付フォーマット %Y%m%d-%H%M%S
extention=$(date +%Y%m%d-%H%M)

# 差分バックアップの参照先をdist_dirの最も新しいディレクトリとする
# なければ、フルバックアップ
link_dest=`ls -rt $dist_dir | tail -n 1`
if [ -n "$link_dest" -a -e ${dist_dir}/${link_dest} ]; then
  link_dest=${dist_dir}/${link_dest}
  #echo "use --link-dest=${link_dest}"
  if [ ${link_dest} = ${dist_dir}/${extention} ]; then
    echo "${link_dest} is already exists."
    exit 1
  fi
fi
#link_dest=""

#rsync -avh --progress user@host:/var/www/html/* /var/www/html/
#rsync -e "ssh -p 10022" -avh user@host:/var/www/html/* /var/www/html/

if [ -z "${link_dest}" ]; then
  rsync -avhz --progress ${src_dir} ${dist_dir}/${extention} || exit 1   # フル
  echo "rsynced full ${dist_dir}/${extention}"
else
  rsync -avhz --delete --progress --link-dest=${link_dest}   \
        #--backup --backup-dir=${dist_dir}/${extention}.diff  \
        ${src_dir} ${dist_dir}/${extention} || exit 1   # 差分
  echo "rsynced diff ${dist_dir}/${extention}"
fi
