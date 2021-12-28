#!/bin/bash
isExistApp=pgrep nginx

if [[ -n $isExistApp ]]; then

systemctl stop nginx.service

fi

isExistApp=pgrep node

if [[ -n $isExistApp ]]; then

killall node

fi
