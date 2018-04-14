#! /bin/bash

grep $(date +"%Y/%m/%d") /var/log/nginx/error.log|grep gn2.genenetwork.org|grep -v "\.php\|robots.txt"|mail -s "Error log nginx on penguin1 for $(date)" $*
