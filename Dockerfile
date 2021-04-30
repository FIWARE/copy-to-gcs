FROM google/cloud-sdk:338.0.0

ENV BACKUP_FOLDER /backup
ENV BACKUP_FILE_PREFIX backup
ENV GCS_KEYFILE_PATH /gcs/credentials.json


ADD copy-files.sh /
RUN mkdir /temp
RUN chmod +w /temp
RUN chmod +x /copy-files.sh

ENTRYPOINT ["/copy-files.sh"]