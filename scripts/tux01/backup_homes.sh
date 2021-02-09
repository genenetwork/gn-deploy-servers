#! /bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root. Run as: su ibackup -c $0"
  exit
fi

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

borgdir=/export/backup/borg/borg-genenetwork

tag=TUX01_BORG_GN2_HOME
sheepdog_run.rb --always -h rabbit -v --tag $tag -c "$borg create --exclude */tmp --stats $borgdir::$tag-$stamp /export/local/home/gn2/production"

tag=TUX01_BORG_GN1_HOME
sheepdog_run.rb --always -h rabbit -v --tag $tag -c "$borg create --stats $borgdir::$TAG-$stamp /home/gn1/lily /home/gn1/production"

tag=TUX01_BORG_GN3_HOME
sheepdog_run.rb --always -h rabbit -v --tag $tag -c "$borg create --stats $borgdir::$tag-$stamp /home/gn3/production"

tag=TUX01_BORG_GN2s_HOME
# sheepdog_run.rb --always -h rabbit -v --tag $tag -c "$borg create --stats $borgdir::$tag-$stamp /export/local/home/gn2-staging/"

tag=TUX01_BORG_ZACH_HOME
# sheepdog_run.rb --always -h rabbit -v --tag $tag -c "$borg create --stats $borgdir::$tag-$stamp /export/local/home/zas1024/"
