FROM google/cloud-sdk:338.0.0

ENV BACKUP_FOLDER=/backup
ENV BACKUP_FILE_PREFIX=backup
ENV GCS_KEYFILE_PATH=/gcs/credentials.json
ENV BACKUP_SCHEDULE="* 1 * * *"

RUN apt-get update
RUN apt-get install -y cron procps
ADD sh /sh
RUN chmod +wx /sh/backup-job
RUN cp /sh/backup-job /etc/cron.d/backup-job
RUN mkdir /temp
RUN chmod +w /temp
RUN chmod -R +rx /sh

ENTRYPOINT ["/sh/setup-cron.sh"]