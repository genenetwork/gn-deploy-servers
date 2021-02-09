#!/bin/bash
# Backup a consistent copy of mariadb

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su mysql -c $0"
  exit
fi

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

backupdir=/home/backup/tux01_mariadb_new
# rm -rf $backupdir/latest
tag="MARIABACKUP_TUX01"
sheepdog_run.rb -h rabbit --always -v --tag $tag -c "mariabackup --backup --target-dir=$backupdir/latest/ --user=webqtlout --password=webqtlout"
tag="MARIABACKUP_PREPARE_TUX01"
sheepdog_run.rb -h rabbit --always -v --tag $tag -c "mariabackup --prepare --target-dir=$backupdir/latest/" 
borgdir=/export2/backup/borg/borg-tux01
tag="BORG-TUX01-MARIADB"
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir $backupdir --args '--stats'
