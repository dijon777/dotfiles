#!/bin/bash
store_dir=/var/research/backup/research.awsvr.com/enqdb

#s3へ保存
aws s3 sync $store_dir s3://wine-research/mysql/ --dryrun
