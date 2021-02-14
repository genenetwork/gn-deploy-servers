#! /bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su ibackup -c $0"
  exit
fi

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

tag=RSYNC_TUX01_P2_REDIS
sheepdog_run.rb -h rabbit -c 'rsync -va /home/redis/ --rsync-path=/usr/bin/rsync -e "ssh -i /home/ibackup/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-redis/' --always -v --tag $tag

tag=RSYNC_TUX01_P2_GN2_PROD
sheepdog_run.rb -h rabbit -c 'rsync -va /home/gn2/production/ --exclude tmp/ --rsync-path=/usr/bin/rsync -e "ssh -i /home/ibackup/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-gn2/' --always -v --tag $tag

# tag=RSYNC_TUX01_P2_MARIADB_LIVE
# sheepdog_run.rb -h rabbit -c 'rsync -va /var/lib/mysql/* --rsync-path=/usr/bin/rsync -e "ssh -i /home/mariadb/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-mariadb/' --always -v --tag $tag

borgdir=/export2/backup/borg/borg-tux01
tag=RSYNC_TUX01_P2_BORG_MARIADB
sheepdog_run.rb -h rabbit -c "rsync -va $borgdir --rsync-path=/usr/bin/rsync -e \"ssh -i /home/ibackup/.ssh/id_backup\" wrk@penguin2.genenetwork.org:/export/backup/tux01/" --always -v --tag $tag

borgdir=/export2/backup/borg/borg-genenetwork
tag=RSYNC_TUX01_P2_BORG_GENENETWORK
sheepdog_run.rb -c "rsync -va $borgdir --rsync-path=/usr/bin/rsync -e \"ssh -i /home/ibackup/.ssh/id_backup\" wrk@penguin2.genenetwork.org:/export/backup/tux01/" --always -v --tag $tag

