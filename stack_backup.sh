#! /bin/bash

# Bitnami Wordpress Stack Backup
# Paul Hartman

# Used from remote system to backup and compress the Bitnami stack stored in /opt
# Will store the local backup in ~/backups. please make sure that this directory exists.

check_errs()
{
  # Function. Parameter 1 is the return code
  # Para. 2 is text to display on failure.
  if [ "${1}" -ne "0" ]; then
    echo "ERROR # ${1} : ${2}"
    # as a bonus, make our script exit with the right error code.
    exit ${1}
  fi
}


today=`date '+-%m-%d-%Y'`;
filename="/home/bitnami/$HOSTNAME.$today.tgz"
# main script starts here ###

tar -cxf ~/backups/$DATE /opt/
check_errs $? "Tarball Failed!"
