#!/bin/bash
set -e
cd /usr/share/nginx/html
rsync -avzh dist/* ./
systemctl start nginx
