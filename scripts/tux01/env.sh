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

  
