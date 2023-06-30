#it will give total size of bucket list which is written is file

#!/bin/bash
  
file="$(cat /home/discusit/aws_s3_bucket_list.txt)"

for i in $file

do
        aws s3 ls $i --human-readable --summarize | grep "Total Size: " | cut -c 15-30

done
