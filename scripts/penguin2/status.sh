#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh


sheepdog_list.rb |tail -20
sheepdog_list.rb --status|jq
