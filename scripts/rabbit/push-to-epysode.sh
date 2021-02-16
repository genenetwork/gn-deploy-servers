#! /bin/bash

echo "Starting $0"
date
echo "rsync to epysode"
rsync -vaz --delete -e "ssh -i $HOME/.ssh/id_rabbit_backup" /export/backup/ epysode.borm.org:/export/backup/rabbit/

