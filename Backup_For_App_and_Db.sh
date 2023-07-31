#!/bin/bash
################ Variables #####################################################
user="karanravat60@gmail.com"
DATE="$(date +%d_%m_%Y)"
DBName="aims_production"
DBUser="qms"
Backup_Location="/home/amneal/Backup"
DocLocation="/home/amneal/Production/jboss-as-7.1.1.Final/docs"
Message1="Backup Completed for the Amneal  Server"
Message2="Backup Failed for the Amneal Server-please check"

################# Dump of the database ##################################################

cd "$Backup_Location"
mkdir "$DATE"
PGPASSWORD=qms_test pg_dump -U "$DBUser" "$DBName" | gzip  > "$Backup_Location"/"$DATE"/qms-db-"$DATE".sql.gz
echo "DB backup done"

cd "$Backup_Location"/"$DATE"
tar -cvzf "$DATE"_DOCS.tar.gz "$DocLocation" 
echo "Application Backup done"

############### To send Mail ##############################
if [ -e "$Backup_Location"/"$DATE"/"$DATE"_DOCS.zip ] && [ -e "$Backup_Location"/"$DATE"/qms-db-"$DATE".sql.gz ] ; then
echo "Pass"
echo "$Message1" | mutt -s "Amneal Backup Status" $user
else
echo "fail"
echo "$Message2" | mutt -s "Amneal Backup Failed" $user
fi

####Note: -e stands for exist, message stands for email body#####
