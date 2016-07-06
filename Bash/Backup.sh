#!bin/bash

#get date and echo
#cron m h dom mn dow command
#min=minute, hour=hour(1-24), dom=day of month(1-31), mname=month(Jan),mnum=1-12,dow=day of week

#get time and date
	min=$(date +%M)
	hour=$(date +%H)
	dom=$(date +%d)
	mname=$(date +%b)
	mnum=$(date +%m)
	dow=$(date +%a)
	year=$(date +%Y)

#echo $h:$m-$dow-$mname-$dom-$year

#Backup 3 times a day locally
#filename sample JAN-10-Wed-1630DBbackup.tar.gz
#after zip delete dump file

#first backup of the day
if[ "$hour" = "7" || "$hour" = "07"]
	then
		echo "True"
	else
		echo "False"
fi

#second backup of the day
if[ "$hour" = "15" ]
	then
		echo "True"
	else
		echo "False"
fi

#Third backup of the day
#send backup via scp
if[ "$hour" = "23" ]
	then
		echo "True"
	else
		echo "False"
fi









#check if directory exists
DIRECTORY=/bin/date.sh

if [ -d "$DIRECTORY" ]; then
    # Will enter here if $DIRECTORY exists, even if it contains spaces

        echo true
        else
        echo false
fi



#check if file exists
FILE=file
if [ ! -f "$FILE" ]; then
    echo "File not found!"
else
	echo "File exists!"
fi














#In this condition 
#we are goin to add label
#to the back up as backup 
#
#
#
#if[ "$dow" == "Wed" ]
#	then
#		echo "True"
#	else
#		echo "False"
#fi

