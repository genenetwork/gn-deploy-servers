#!/bin/bash
# Backup a consistent copy of mariadb

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su mysql -c $0"
  exit
fi

# ---- for sheepdog

export GEM_PATH=/home/pjotr/opt/deploy/lib/ruby/vendor_ruby  
export PATH=/home/pjotr/iwrk/deploy/deploy/bin:/home/pjotr/opt/deploy/bin:$PATH                                                                                                                                       
backupdir=/home/backup/tux01_mariadb_new
# test: su mysql -c mariabackup --backup --target-dir=$backupdir/latest/ --user=webqtlout --password=webqtlout
rm -rf $backupdir/latest
tag="MARIABACKUP_TUX01"
sheepdog_run.rb --always -v --tag $tag -c "mariabackup --backup --target-dir=$backupdir/latest/ --user=webqtlout --password=webqtlout"
tag="MARIABACKUP_PREPARE_TUX01"
sheepdog_run.rb --always -v --tag $tag -c "mariabackup --prepare --target-dir=$backupdir/latest/" 

borg=/home/pjotr/opt/borg/bin/borg
# . /home/wrk/.borg-pass
export stamp=$(date +%A-%Y%m%d-%H:%M:%S)
echo $stamp
echo "Starting $0"
date

# echo "Backup /etc"
# # sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-etc::P2_etc-$stamp /etc" --tag 'BORG-TUX01-ETC' --log

# test: su mysql -c "$borg create $borgdir::TUX01_Mariadb-$stamp $backupdir --progress"

borgdir=/export/backup/borg/borg-tux01
tag="BORG-TUX01-MARIADB"
sheepdog_run.rb --always -v --tag $tag -c "$borg create  --stats $borgdir::TUX01_Mariadb-$stamp $backupdir"
