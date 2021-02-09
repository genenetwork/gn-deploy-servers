#!/bin/bash

echo "Please do not run from CRON for security reasons"

# ---- for sheepdog

export GEM_PATH=/home/pjotr/opt/deploy/lib/ruby/vendor_ruby  
export PATH=/home/pjotr/iwrk/deploy/deploy/bin:/home/pjotr/opt/deploy/bin:$PATH                                                                                                                                       
borg=/home/pjotr/opt/borg/bin/borg
. /root/.borg-pass
export stamp=$(date +%A-%Y%m%d-%H:%M:%S)
echo $stamp
echo "Starting $0"
date

# echo "Backup /etc"
# # sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-etc::P2_etc-$stamp /etc" --tag 'BORG-TUX01-ETC' --log

# test: su mysql -c "$borg create $borgdir::TUX01_Mariadb-$stamp $backupdir --progress"

borgdir=/export/backup/borg/snapshots/tux01-etc
tag="BORG-TUX01-ETC"
sheepdog_run.rb --always -v --tag $tag -c "$borg create --stats $borgdir::TUX01_etc-$stamp /etc"
