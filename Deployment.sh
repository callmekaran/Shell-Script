# Get the current date 

DATE=$(date +"%Y-%m-%d")

# Get the build ID

BUILD_NUMBER=${BUILD_NUMBER}

# Extract the year and month from the date

YEAR=$(date +"%Y")
MONTH=$(date +"%m")

# Create the directory using the year, month, date, and build ID variables

DIRECTORY_NAME="${YEAR}/${MONTH}/${DATE}Build${BUILD_NUMBER}"
BACKUP_DIRECTORY_NAME="${YEAR}/${MONTH}/${DATE}Build${BUILD_NUMBER}_Backup"
DEPLOYMENT_DIRECTORY="/home/ubuntu/server/151/jboss-as-7.1.1.Final/standalone/deployments"
STANDALONE_DIRECTORY="/home/ubuntu/server/151/jboss-as-7.1.1.Final/standalone/"

########DIrectory-Creation####################

mkdir -p /home/ubuntu/server/151/deployment/"${DIRECTORY_NAME}"
mkdir -p /home/ubuntu/server/151/deployment/"${BACKUP_DIRECTORY_NAME}"

# Taking Backup of old wars & put new war in the today`s date file

cp ${DEPLOYMENT_DIRECTORY}/*.war /home/ubuntu/server/151/deployment/"${BACKUP_DIRECTORY_NAME}"
cp /home/ubuntu/warpoint/*.war /home/ubuntu/server/151/deployment/"${DIRECTORY_NAME}"

########################### Listing WarPoint Directory ################################
ls /home/ubuntu/warpoint/*.war

########################### Removing WarPoint Directory ###########################

rm /home/ubuntu/warpoint/*.war
cp /home/ubuntu/server/151/deployment/${DIRECTORY_NAME}/*.war /home/ubuntu/server/151/jboss-as-7.1.1.Final/standalone/deployments/

PID=`ps -eaf | grep 151 | grep -v grep | awk '{print $2}'`
echo "killing $PID Qms Demo application"
kill -9 $PID

echo $PID

rm ${DEPLOYMENT_DIRECTORY}/*.deployed
rm ${DEPLOYMENT_DIRECTORY}/*.failed
rm -r ${STANDALONE_DIRECTORY}/data/
rm -r ${STANDALONE_DIRECTORY}/tmp/vfs
sh /home/ubuntu/script/jboss_start/jboss_start_151_jenkins.sh
sleep 1m
tail -2000 /home/ubuntu/server/151/jboss-as-7.1.1.Final/standalone/log/server.log | grep -ie Deployed -ie ERROR -ie Fail

