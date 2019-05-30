#!/bin/sh
DIRECTORY="./listCron"

if [ ! -d $DIRECTORY ]; then
  mkdir $DIRECTORY
fi
crontab -l > ./listCron/cron.txt
ls -alh /var/spool/cron > ./listCron/lscron.txt
ls -al /etc/ | grep cron >> ./listCron/lscron.txt
ls -al /etc/cron* >> ./listCron/lscron.txt
cat /etc/cron.d/* >> ./listCron/cron.txt
cat /etc/at.allow >> ./listCron/cron.txt
cat /etc/at.deny >> ./listCron/cron.txt
cat /etc/cron.allow >> ./listCron/cron.txt
cat /etc/cron.deny >> ./listCron/cron.txt
cat /etc/crontab >> ./listCron/cron.txt
cat /etc/anacrontab >> ./listCron/cron.txt
cat /var/spool/cron/crontabs/root >> ./listCron/cron.txt
