#!/bin/sh
crontab -l > cron.out
ls -alh /var/spool/cron >> lscron.txt
ls -al /etc/ | grep cron >> lscron.txt
ls -al /etc/cron* >> lscron.txt
cat /etc/cron.d/* >> cron.txt
cat /etc/at.allow >> cron.txt
cat /etc/at.deny >> cron.txt
cat /etc/cron.allow >> cron.txt
cat /etc/cron.deny >> cron.txt
cat /etc/crontab >> cron.txt
cat /etc/anacrontab >> cron.txt
cat /var/spool/cron/crontabs/root >> cron.txt
