#! /bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su ibackup -c $0"
  exit
fi

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

borgdir=/export/backup/borg/borg-genenetwork

tag=TUX01_BORG_GN2_HOME
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir --args '--exclude */tmp' /export/local/home/gn2/production

tag=TUX01_BORG_GN1_HOME
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir --args '--exclude */tmp' /home/gn1/production

tag=TUX01_BORG_GN3_HOME
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir --args '--exclude */tmp' /home/gn3/production

tag=TUX01_BORG_GN2s_HOME
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir --args '--exclude */tmp --stats' /home/gn2-staging/staging

tag=TUX01_BORG_ZACH_HOME
sheepdog_borg.rb -h rabbit --always -v --tag $tag -b $borgdir --args '--exclude */tmp --stats' /home/zas1024/*

