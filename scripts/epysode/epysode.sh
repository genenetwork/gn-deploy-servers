#! /bin/bash
#
# 4x per day
#
# ---- for sheepdog
export GEM_PATH=/home/wrk/opt/deploy/lib/ruby/vendor_ruby
export PATH=/home/wrk/iwrk/deploy/deploy/bin:/home/wrk/opt/deploy/bin:$PATH

# 0 0 * * 0 sheepdog_run.rb -c '/sbin/fstrim -a' --tag TRIM --log >> ~/cron.log &2>1


borg=/home/wrk/opt/borg/bin/borg
. /home/wrk/.borg-pass
export stamp=$(date +%A-%Y%m%d-%H:%M:%S)
echo $stamp
echo "Starting $0"
date
# echo "Backup /etc"
# sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-etc::P2_etc-$stamp /etc" --tag 'BORG-TUX01-ETC' --log

echo FETCH_EPY_P2
sheepdog_run.rb -c 'rsync -va --delete -e "ssh -i ~/.ssh/id_epysode" penguin2.genenetwork.org:/export/backup/borg* /export/backup/p2/' --tag FETCH_EPY_P2 --log -v --always

TAG=BORG_BORG_EPY
echo Incremental backup of backups $TAG
sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-borg::$TAG-$stamp /export/backup/p2/*" --tag $TAG --log 

chown wrk.wrk -R /export/backup/
chown wrk.wrk /export/backup
chmod 0700 /export/backup
