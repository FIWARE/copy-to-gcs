#!/bin/bash -e

set -e

echo "Run copy"

date=$(date "+%Y-%m-%dT%H:%M:%SZ")
filename=${BACKUP_FILE_PREFIX}-backup-${date}.tar.gz
tar -czvf /temp/${filename} ${BACKUP_FOLDER}

gcloud auth activate-service-account --key-file=${GCS_KEYFILE_PATH}
gsutil cp /temp/${filename} ${GCS_BUCKET}/${filename}

echo "Copy finished"
