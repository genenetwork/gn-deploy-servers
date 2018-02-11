#! /bin/sh

# if [ $(id -u) = "0" ]; then
#   echo Can not run as root
#   exit 1
# fi

ulimit -n 65536 
sysctl -w vm.max_map_count=262144

su elasticsearch -c "env JAVA_HOME=/opt/jdk-9.0.4 /opt/elasticsearch-6.2.1/bin/elasticsearch"  &

exit 0
