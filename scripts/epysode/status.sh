#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

echo Last 40 messages:
sheepdog_list.rb |tail -40
echo Last 10 fail:
sheepdog_list.rb |grep FAIL|tail -10
# sheepdog_list.rb --status|jq

