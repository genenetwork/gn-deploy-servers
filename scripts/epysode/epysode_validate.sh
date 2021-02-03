#! /bin/bash
#
# Options:
#
#   --verify-data

VERIFY=$1
echo $VERIFY
[ $VERIFY == "--verify-data" ] && VERIFY="_FULL" 

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

TAG=VALIDATE_BORG_IPFS$VERIFY
echo $TAG
sheepdog_run.rb -c "$borg check /export/backup/p2/borg-ipfs/ $*" --tag $TAG --log -v --always 

TAG=VALIDATE_BORG_ETC$VERIFY
echo $TAG
sheepdog_run.rb -c "$borg check /export/backup/p2/borg-etc/ $*" --tag $TAG --log -v --always

TAG=VALIDATE_BORG_GITEA$VERIFY
echo $TAG
sheepdog_run.rb -c "$borg check /export/backup/p2/borg-gitea/ $*" --tag $TAG --log -v --always

TAG=VALIDATE_BORG_TUX01$VERIFY
echo $TAG
sheepdog_run.rb -c "$borg check /export/backup/p2/borg-tux01/ $*" --tag $TAG --log -v --always

TAG=VALIDATE_BORG_GN2$VERIFY
echo $TAG
sheepdog_run.rb -c "$borg check /export/backup/p2/borg-gn2/ $*" --tag $TAG --log -v --always

