#! /bin/bash

temp_file=$(mktemp)

tail -2000 /home/staging/tmp/test.log|grep $(date +"%Y%m%d")|grep -v index_|grep -B 2 -i "error\|fail" > $temp_file

if [ -s $temp_file ]; then
  cat $temp_file | mail -s "Error log GN2_STAGING on penguin1 for $(date)" $*
fi

rm -fv $temp_file

