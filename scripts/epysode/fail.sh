#! /bin/bash

# ---- for sheepdog
export GEM_PATH=/home/wrk/opt/deploy/lib/ruby/vendor_ruby
export PATH=/home/wrk/iwrk/deploy/deploy/bin:/home/wrk/opt/deploy/bin:$PATH

sheepdog_list.rb --status|jq  -j '.[]| select(.status=="FAIL")'
# sheepdog_list.rb --status|jq '.[]| select(.status=="FAIL") | { time: .time, tag: .tag, status: .status }'

echo today:
sheepdog_list.rb --status|jq -j --arg datex $(date +%Y-%m-%d) '.[]| select(.status=="FAIL") | select(.time|test($datex|debug))'

# sheepdog_list.rb --status|jq -j --arg date "2" '.[]| select(.status=="FAIL") | select(.time|test("^2021-01-13."))'
