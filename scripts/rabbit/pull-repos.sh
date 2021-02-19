#! /bin/bash

echo "Starting $0"
date
# tux01 is coming from penguin2 anyway!
# echo "rsync from Tux01"
# rsync -vaz --delete -e "ssh -i $HOME/.ssh/id_rabbit_backup" pjotr@tux01:/home/mariadb/database /export/backup/tux01/
echo "rsync from Penguin2"
rsync -vaz --delete -e "ssh -i $HOME/.ssh/id_rabbit_backup" penguin2.genenetwork.org:/export/backup/ /export/backup/penguin2/

