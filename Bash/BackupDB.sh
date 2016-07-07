#!bin/bash
#filename BackupDB.sh
#filename sample for backup JAN_10_Wed_1630DBbackup.tar.gz
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
#Database Parameters
        userdb=root
        password=root
        database=names_db
        backup_name=$mname"_"$dom"_"$dow"_"$hour"."$min$database"."sql
       	backup_dir=backupdb/
#----------------------
#Compressing Variables
#Name of backup when zipped
        zip_name=$mname"_"$dom"_"$dow"_"$hour"."$min$database"."tar.gz
#---------------------
#Transferring Variables
        user=root
        password=root
        server=192.168.0.251
        dir=/home/gem/

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

	fi
