#!bin/bash
#filename BackupDB.sh
#filename sample for backup _JAN_10_Wed_1630DBbackup.tar.gz
#get time and date
        min=$(date +%M)
        hour=$(date +%H)
        dom=$(date +%d)
        mname=$(date +%b)
        mnum=$(date +%m)
        dow=$(date +%a)
        year=$(date +%Y)


        #Put Parameters here
#---------------------
#Finding Prefix/labeling i.e Last_Wedof$backup_name

            week=$(date +%a)
            last_7day=$(date -d "`date +%Y%m01` +1 month -7day" +%d)
            today=$(date +%d)
            #if today > last_7day
                if [ $today -ge $last_7day ] && [ "$week" = "Wed" ];
                then
                #true
                prefix_name="Last_Wedof"
                else
                prefix_name=""
                fi

#Database Parameters
        userdb=root
        password=root
        database=names_db
        backup_name=$prefix_name$mname"_"$dom"_"$dow"_"$hour"."$min$database"."sql
        backup_dir=backupdb/
#----------------------
#Compressing Variables
#Name of backup when zipped
        zip_name=$prefix_name$mname"_"$dom"_"$dow"_"$hour"."$min$database"."tar.gz
#---------------------
#Transferring Variables
        user=root
        server=192.168.0.251
        remote_dir=/home/gem/

#Bash process start

#go to backup directory
cd $backup_dir
    #create a database dump file
    mysqldump -u$userdb -p$password --single-transaction --quick --lock-tables=false $database > $backup_name
    #if successful
    if [ "$?" -eq 0 ]
    then
    #compress using gzip tar
        tar -cpzf $zip_name $backup_name




  #Send Backup Daily to Remote Server  
        if [ "$?" -eq 0 ]
        then
        #Send the Backup
        scp -q $zip_name $user@$server:$remote_dir


        fi

    


    #end if for zipping
    fi
