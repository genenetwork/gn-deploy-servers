#! /bin/bash
#

if [ "$USER" != "ipfs" ] ; then
  echo "You must login with the correct user"
  exit 1
fi

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

sheepdog_borg.rb --tag BORG-P2-IPFS -b /export/backup/borg/borg-ipfs /export/ipfs --always $*
