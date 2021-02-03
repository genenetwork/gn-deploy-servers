#! /bin/bash

# ---- for sheepdog
export GEM_PATH=/home/pjotr/opt/deploy/lib/ruby/vendor_ruby
export PATH=/home/pjotr/iwrk/deploy/deploy/bin:/home/pjotr/opt/deploy/bin:$PATH

echo Last 40 messages:
sheepdog_list.rb |tail -40
echo Last 10 fail:
sheepdog_list.rb |grep FAIL|tail -10

