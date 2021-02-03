#! /bin/bash

# ---- for sheepdog
export GEM_PATH=/home/pjotr/opt/deploy/lib/ruby/vendor_ruby                                                  
export PATH=/home/pjotr/iwrk/deploy/deploy/bin:/home/pjotr/opt/deploy/bin:$PATH                               

# 0 0 * * 0 sheepdog_run.rb -c '/sbin/fstrim -a' --tag TRIM --log >> ~/cron.log &2>1
                                       
                                                                                                          
borg=/home/wrk/opt/borg/bin/borg
. /home/wrk/.borg-pass
export stamp=$(date +%A-%Y%m%d-%H:%M:%S)
echo $stamp                 
echo "Starting $0"       
date                                

# echo "Backup /etc"
# sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-etc::P2_etc-$stamp /etc" --tag 'BORG-TUX01-ETC' --log

tag=RSYNC_REDIS_TUX01_P2
sheepdog_run.rb -c 'rsync -va /home/redis/ --rsync-path=/usr/bin/rsync -e "ssh -i /home/pjotr/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-redis/' --always -v --tag $tag

tag=RSYNC_GN2_PROD_TUX01_P2
sheepdog_run.rb -c 'rsync -va /home/gn2/production/ --exclude tmp/ --rsync-path=/usr/bin/rsync -e "ssh -i /home/pjotr/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-gn2/' --always -v --tag $tag

tag=RSYNC_MARIADB_TUX01_P2
sheepdog_run.rb -c 'rsync -va /var/lib/mysql/* --rsync-path=/usr/bin/rsync -e "ssh -i /home/pjotr/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-mariadb/' --always -v --tag $tag

tag=RSYNC_MARIADB_TUX01_P2_NEW
sheepdog_run.rb -c 'rsync -va /home/backup/tux01_mariadb_new --rsync-path=/usr/bin/rsync -e "ssh -i /home/pjotr/.ssh/id_backup" wrk@penguin2.genenetwork.org:/export/backup/tux01-mariadb-new' --always -v --tag $tag

chown pjotr.pjotr -R /export/backup/
chown pjotr.pjotr /export/backup
chmod 0700 /export/backup            
