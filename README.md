# Copy to GCS

A simple docker image to copy files from a given folder as tar-archive to a gcs-bucket. It can f.e. be used to backup filestructures from PVCs inside
Kubernetes.

## Config

Following env vars are supported:

|  Env-Var | Description | Example |
| ----------------- | ----------------------------------------------- | ------------------------ |
| BACKUP_FOLDER        | The folder to be copied into gcs   |  /backup  |                            
| BACKUP_FILE_PREFIX | Prefix to be used for the tar-file. Will create a name in form of ```<Prefix>-backup-<date>.tar.gz```     |  backup   |
| GCS_KEYFILE_PATH | Path to the serviceaccount json file to be used for the bucket. | /gcs/credentials.json |
| GCS_BUCKET | Name of the backet to be used. | null |

## Usage

```docker run -v /myFolder:/backup -v /my-serviceaccount/service-account.json:/gcs/credentials.json -e GCS_BUCKET=gs://backups/bucket  wistefan/gcs-folder-backup:latest```

