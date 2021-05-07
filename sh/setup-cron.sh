#!/bin/bash -e

if [[ ! -z ${BACKUP_SCHEDULE} ]]
 then
  declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env
  sed -i "s,BACKUP_SCHEDULE,${BACKUP_SCHEDULE},g" /etc/cron.d/backup-job
  cat  /etc/cron.d/backup-job
  crontab /etc/cron.d/backup-job
  touch /sh/cron.log
  cron -f
 else
  /sh/copy-files.sh
fi
