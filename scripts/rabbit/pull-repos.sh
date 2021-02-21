#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

sheepdog_rsync.rb --tag RABBIT_RSYNC_P2 wrk@penguin2.genenetwork.org:/export/backup/ /export/backup/penguin2/ --always -v --args '-e "ssh -i /home/wrk/.ssh/id_rabbit_backup"'

