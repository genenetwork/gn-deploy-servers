#!/bin/bash
#
# Note redis is running on rabbit through localhost tunnel.

export GEM_PATH=~/opt/deploy/lib/ruby/vendor_ruby
export PATH=~/iwrk/deploy/deploy/bin:~/opt/deploy/bin:$PATH

sshfs -o IdentityFile=~/.ssh/id_ecdsa_backup bacchus@tux01:/ ~/mnt
sheepdog_run.rb --tag BACCHUS_RSYNC_TUX01 -c 'rsync -va /var/services/homes/pjotr/mnt/ /volume1/common/backup/machines/tux01/' --always -v
fusermount -u ~/mnt
