#!/bin/bash

DB_NAME=""
DB_USER=""
DB_PASSWORD=""
S3_BUCKET="s3://databackup"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="/tmp/${DB_NAME}_${DATE}.sql"

# Create a backup of the database
echo "Creating backup for database ${DB_NAME}..."
mysqldump -u${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_FILE}

# Check if mysqldump succeeded
if [ $? -eq 0 ]; then
  echo "Backup created successfully: ${BACKUP_FILE}"
else
  echo "Failed to create backup" >&2
  exit 1
fi

# Upload backup to S3
echo "Uploading backup to S3 bucket ${S3_BUCKET}..."
s3cmd put ${BACKUP_FILE} ${S3_BUCKET}

# Check if aws s3 cp succeeded
if [ $? -eq 0 ]; then
  echo "Backup uploaded successfully to ${S3_PATH}"
else
  echo "Failed to upload backup to S3"
  exit 1
fi

# Clean up local backup file
rm ${BACKUP_FILE}
echo "Local backup file removed: ${BACKUP_FILE}"

echo "Backup process completed successfully."

# Exit script
exit 0
