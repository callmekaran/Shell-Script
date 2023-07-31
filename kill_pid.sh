PID=`ps -eaf | grep 151 | grep -v grep | awk '{print $2}'`
echo "killing $PID Qms Demo application"
kill -9 $PID

echo $PID
