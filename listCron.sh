#!/usr/bin/env bash
DIRECTORY="./listCron"
LSFILE="lscron.txt"
CRONFILE="cron.txt"

# Files/dirs we're hitting
LSLIST=( "/var/spool/cron" "/etc/cron*" )
CRONLIST=( "/etc/cron.d/*" "/etc/at.allow" "/etc/at.deny" "/etc/cron.allow" "/etc/cron.deny" "/etc/crontab" "/etc/anacrontab" "/var/spool/cron/crontabs/root" )

#Create Directory if one does not exist
if [ ! -d $DIRECTORY ]; then
  mkdir $DIRECTORY
fi

# Clean out previous run, if one existed. Add Date to top of file.
bash -c "date > $DIRECTORY/$LSFILE"
bash -c "date > $DIRECTORY/$CRONFILE"

crontab -l >> $DIRECTORY/$CRONFILE
ls -al /etc/ | grep cron >> $DIRECTORY/$CRONFILE

for dir in ${LSLIST[*]}
do
    ls -alh $dir >> $DIRECTORY/$LSFILE
done

for cron in ${CRONLIST[*]}
do
    cat $cron >> $DIRECTORY/$CRONFILE
done

exit 0
