# <a name="top"></a>Copy to GCS
[![License: MIT](https://img.shields.io/github/license/FIWARE/helm-charts.svg)](https://opensource.org/licenses/MIT)
[![Docker badge](https://img.shields.io/docker/pulls/fiware/copy-to-gcs.svg)](https://hub.docker.com/r/fiware/copy-to-gcs/)


A simple docker image to copy files from a given folder as tar-archive to a gcs-bucket. It can f.e. be used to backup filestructures from PVCs inside
Kubernetes. The copy will be executed on a cron schedule. If the copy fails, the container will be killed.

| :whale: [Docker Hub](https://hub.docker.com/r/fiware/copy-to-gcs/) | 

## Table of contents
* [Config](#config)
* [Usage](#Usage)

## Config

Following env vars are supported:

|  Env-Var | Description | Example |
| ----------------- | ----------------------------------------------- | ------------------------ |
| BACKUP_SCHEDULE      | The cron schedule to be executed   |  * 1 * * *  |                            
| BACKUP_FOLDER        | The folder to be copied into gcs   |  /backup  |                            
| BACKUP_FILE_PREFIX | Prefix to be used for the tar-file. Will create a name in form of ```<Prefix>-backup-<date>.tar.gz```     |  backup   |
| GCS_KEYFILE_PATH | Path to the serviceaccount json file to be used for the bucket. | /gcs/credentials.json |
| GCS_BUCKET | Name of the backet to be used. | null |

## Usage

```docker run -v /myFolder:/backup -v /my-serviceaccount/service-account.json:/gcs/credentials.json -e GCS_BUCKET=gs://backups/bucket  wistefan/gcs-folder-backup:latest```

