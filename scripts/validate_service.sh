#!/bin/bash
service=codedeploy-agent
if [ -f /usr/local/var/run/nginx.pid ]; then
   echo "Nginx is running"

fi


if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
then
  echo "$service is running!!!"

fi
