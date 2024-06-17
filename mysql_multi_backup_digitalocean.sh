#Database Backup and Upload Script for DigitalOcean Spaces

1. Install s3cmd

sudo apt-get update
sudo apt-get install s3cmd -y

2. Configure s3cmd

s3cmd --configure

During the configuration, you will need to provide:

Access Key: Your DigitalOcean API access key.
Secret Key: Your DigitalOcean API secret key.
Endpoint URL: The endpoint URL for your region, such as nyc3.digitaloceanspaces.com or blr1.digitaloceanspaces.com.
Bucket URL Template: The template URL to access your bucket, such as %(bucket)s.nyc3.digitaloceanspaces.com.

# REFRENCE - (setup s3cmd for upload and use cli) - https://docs.digitalocean.com/products/spaces/reference/s3cmd/

3. Write the Backup & Upload Script

#!/bin/bash

# Define MySQL database credentials
DB_USER="your_mysql_username"
DB_PASSWORD="your_mysql_password"
DB_NAME="your_database_name"

# Define backup directory
BACKUP_DIR="/root/database_backup"

# Generate backup file name with current date
BACKUP_FILE="$BACKUP_DIR/$(date +'%d-%m-%Y').sql.gz"

# MySQL dump command to create the backup
echo "Starting MySQL backup..."
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME | gzip > $BACKUP_FILE

# Check if backup was successful
if [ $? -ne 0 ]; then
    echo "MySQL backup failed. Exiting."
    exit 1
else
    echo "MySQL backup created successfully: $BACKUP_FILE"
fi

# Upload backup file to S3 bucket using AWS CLI
AWS_BUCKET="s3://bucket-name/database-folder/"

echo "Uploading backup to DigitalOcean Space..."

s3cmd put $BACKUP_FILE $AWS_BUCKET

# Check if upload was successful

if [ $? -ne 0 ]; then
    echo "Upload to DigitalOcean Space failed. Exiting."
    exit 1
else
    echo "Backup uploaded successfully to DigitalOcean Space."
    # Optionally remove the local backup file
    rm $BACKUP_FILE
    echo "Local backup file removed: $BACKUP_FILE"
fi

echo "Backup and upload process completed successfully."
