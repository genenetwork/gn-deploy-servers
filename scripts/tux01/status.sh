#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

echo Last messages:
sheepdog_list.rb -h rabbit $*|tail -120
echo Last 10 fail:
echo "==== Tux01:"
sheepdog_list.rb -h localhost |grep FAIL $*|tail -10
echo "==== Rabbit:"
sheepdog_list.rb -h rabbit $*|grep FAIL|tail -10

