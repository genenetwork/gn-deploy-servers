#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

for x in BORG-TUX01-MARIADB TUX01_BORG_GN2_HOME TUX01_BORG_GN1_HOME TUX01_BORG_GN3_HOME TUX01_BORG_GN2s_HOME TUX01_BORG_ZACH_HOME RSYNC_TUX01_P2_GN2_PROD RSYNC_TUX01_P2_REDIS RSYNC_TUX01_P2_BORG_MARIADB RSYNC_TUX01_P2_BORG_GENENETWORK; do 
  sheepdog_expect.rb --filter $x -v 
done

sheepdog_expect.rb --filter BACCHUS_RSYNC_TUX01 -v 

