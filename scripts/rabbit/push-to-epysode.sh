#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

RDIR=$HOME/mnt

mkdir -p $RDIR
sheepdog_run.rb --tag MOUNT -c "/usr/bin/sshfs -o IdentityFile=/home/wrk/.ssh/id_rabbit_backup \
  ibackup@epysode.borm.org:/ $RDIR" -v --always
sleep 1
sheepdog_run.rb --tag TEST -c "ls -l $RDIR" --always -v
sheepdog_rsync.rb --tag BACCHUS_RSYNC_EPI /export/backup/ $RDIR/rabbit/  --always -v
sheepdog_run.rb --tag UNMOUNT -c "/bin/fusermount -u $RDIR" -v --always

# rsync -vaz --delete -e "ssh -i $HOME/.ssh/id_rabbit_backup" /export/backup/ epysode.borm.org:/export/backup/rabbit/

