#! /bin/bash

tail -2000 /home/production/tmp/test.log|grep $(date +"%Y%m%d")|grep -v index_|grep -B 2 -i "error\|fail"|mail -s "Error log GN2 on penguin1 for $(date)" $*
