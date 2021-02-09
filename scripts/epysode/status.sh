#! /bin/bash

# ---- for sheepdog
export GEM_PATH=/home/wrk/opt/deploy/lib/ruby/vendor_ruby
export PATH=/home/wrk/iwrk/deploy/deploy/bin:/home/wrk/opt/deploy/bin:$PATH

echo Last 40 messages:
sheepdog_list.rb |tail -40
echo Last 10 fail:
sheepdog_list.rb |grep FAIL|tail -10
# sheepdog_list.rb --status|jq

