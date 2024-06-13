#!/bin/bash

# Define MySQL server connection details
MYSQL_HOST="localhost"
MYSQL_USER="admin"
MYSQL_PASSWORD="admin@123"

# Specify the file that contains the list of database names
DATABASE_LIST_FILE="database_list"

# Loop through each line in the database list file
while IFS= read -r dbname
do
    # removes any extra spaces before and after the database name
    dbname=$(echo "$dbname" | xargs)

    # Skip empty lines or lines starting with '#'
    if [[ -z "$dbname" || "$dbname" == "#"* ]]; then
        continue
    fi

    # Define the output file name for the backup
    outfile="${dbname}_backup.sql"

    # Inform the user that the backup process for this database is starting
    echo "Initiating backup for database: $dbname"

    # Execute mysqldump to back up the current database to the specified output file
    mysqldump -u "$MYSQL_USER" -h "$MYSQL_HOST" -p"$MYSQL_PASSWORD" "$dbname" > "$outfile" 2>/dev/null

    # Check if mysqldump was successful
    if [ $? -eq 0 ]; then
        echo "Backup of database '$dbname' completed successfully. Output file: $outfile"
    else
        echo "Error: Backup of database '$dbname' failed. Please check the MySQL credentials and connection."
    fi

done < "$DATABASE_LIST_FILE"
