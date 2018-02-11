#! /bin/bash

if [ ! $USER="gn2" ] ; then
  echo "Only run this script as gn2"
fi

export GN2_PROFILE=/usr/local/guix-profiles/gn2-2.11rc2

kill="kill $(ps -ef | grep 'gn2 ' | grep 'gunicorn' |grep -v grep | awk '{print $2}')"
echo $kill
`$kill`

cd /home/production/gene
env TMPDIR=/home/production/tmp SERVER_PORT=5000 GENENETWORK_FILES=/home/zas1024/genotype_files SQL_URI=mysql://*.*@lily.uthsc.edu/db_webqtl ./bin/genenetwork2 ./etc/default_settings.py -gunicorn-prod &>> /home/production/tmp/test.log &

echo Running $(ps -ef | grep 'gn2 ' | grep 'gunicorn')
echo See the log with: tail -f /home/production/tmp/test.log



