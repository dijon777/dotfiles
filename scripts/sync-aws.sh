#!/bin/bash
store_dir=/var/research/backup/research.awsvr.com/enqdb

#s3へ保存 (exact-timestampsがないとファイルサイズが同じだと同期されない)
aws s3 sync --exact-timestamps --delete $store_dir s3://wine-research/mysql/
