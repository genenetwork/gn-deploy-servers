#!/bin/bash
# Backup a consistent copy of mariadb

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su ibackup -c $0"
  exit
fi

# ---- for sheepdog

export GEM_PATH=/home/pjotr/opt/deploy/lib/ruby/vendor_ruby  
export PATH=/home/pjotr/iwrk/deploy/deploy/bin:/home/pjotr/opt/deploy/bin:$PATH                                                                                                                                       
sheepdog_run.rb -v --tag RSYNC_HOME_GN3_TUX02 -c "rsync -va --exclude=\".*\" /home/gn3 tux02:/export3/backup/tux01"
sheepdog_run.rb -v --tag RSYNC_HOME_REDIS_TUX02 -c "rsync -va --exclude=\".*\" /home/redis/ tux02:/export3/backup/tux01/redis"
sheepdog_run.rb -v --tag RSYNC_HOME_BACKUP_TUX02 -c "rsync -va --exclude=\".*\" /home/backup tux02:/export3/backup/tux01"
sheepdog_run.rb -v --tag RSYNC_HOME_GN2_TUX02 -c "rsync -va --exclude=\".*\" --exclude=\"tmp\" /home/gn2/ tux02:/export3/backup/tux01/gn2"
sheepdog_run.rb -v --tag RSYNC_HOME_ZAS1024_TUX02 -c "rsync -va --exclude=\".*\" --exclude=\"tmp\" /home/zas1024/ tux02:/export3/backup/tux01/gn2"


