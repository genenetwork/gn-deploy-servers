#! /bin/bash
#

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

borg=/home/wrk/opt/borg/bin/borg
. /home/wrk/.borg-pass
export stamp=$(date +%A-%Y%m%d-%H:%M:%S)
echo $stamp
echo "Starting $0"
date
echo "Backup /etc BORG-P2-ETC"
sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-etc::P2_etc-$stamp /etc" --tag 'BORG-P2-ETC' --log --always --host epysode.borm.org 

echo "Backup /export/ipfs BORG-P2-IPFS"
sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-ipfs::P2_ipfs-$stamp /export/ipfs" --tag 'BORG-P2-IPFS' --log --always --host epysode.borm.org 

echo "Backup gitea BORG-P2-GITEA"
sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-gitea::P2_gitea-$stamp /export/git/gitea" --tag 'BORG-P2-GITEA' --log --always --host epysode.borm.org 

echo "Backup tux01 mariabd, redis etc. BORG-P2-TUX01"
sheepdog_run.rb -c "$borg create  --stats /export/backup/borg-tux01::P2_tux01-$stamp /export/backup/tux01-*" --tag 'BORG-P2-TUX01' --log --always --host epysode.borm.org 

# chown wrk.wrk /export/backup
# chown wrk.wrk -R /export/backup/
# chmod 0700 /export/backup
