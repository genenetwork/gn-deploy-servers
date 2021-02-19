#!/bin/bash
#
# Note redis is running on rabbit through localhost tunnel. Cron in /etc/crontab:
#
# 0 7 * * * pjotr /volume1/common/backup/scripts/bacchus/backup_tux01.sh


export GEM_PATH=~/opt/deploy/lib/ruby/vendor_ruby
export PATH=~/iwrk/deploy/deploy/bin:~/opt/deploy/bin:$PATH

sheepdog_run.rb --tag MOUNT -c "/home/pjotr/.guix-profile/bin/sshfs -o IdentityFile=~/.ssh/id_ecdsa_backup bacchus@tux01:/ ~/mnt" -v --always
sleep 1
sheepdog_run.rb --tag TEST -c "ls -l ~/mnt" --always -v
sheepdog_rsync.rb --tag BACCHUS_RSYNC_TUX01 /var/services/homes/pjotr/mnt/ /volume1/common/backup/machines/tux01/ --always -v
fusermount -u ~/mnt
