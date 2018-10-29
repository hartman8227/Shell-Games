#! /bin/bash


# Settings
    #LOCAL WORKING DIRECTORY
    LOCAL_DIR=~/working/web/hartman

    # SSH SETTINGS
    REMOTE_SERVER=www.hartmanandcompany.us
    REMOTE_USER=ubuntu
    KEY=~/Documents/AlphaStoreFixtures.pem
    REMOTE_DIR=/var/www/html

    # Other stuff
    NOW=$(date +"%m_%d_%Y")

#ERROR CHECKING
    #Thanks to www.shellscript.sh for this little bit
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

# MAIN PROGRAM

    # BUILD UPLOAD ARCHIVE
        tar -cf update.tar $LOCAL_DIR
        check_errs $? "TAR Failed"
    # TRANSFER TO REMOTE SERVER
        scp -i $KEY $LOCAL_DIR/update.tar $REMOTE_USER@REMOTE_SERVER $REMOTE_DIR
        check_errs $? "File transfer failed"
    # DELETE LOCAL ARCHIVE
        rm $LOCAL_DIR/update.tar
        check_errs $? "DANGER: CHECK FILE SYSTEM AND WORKING DIRECTORY! Deleting update failed!"
        # Backup remote Directory
        ssh -i $KEY $REMOTE_USER@$REMOTE_SERVER 'tar -cf $REMOTEDIR/website_backup_$NOW; '
        check_errs $! "problem making backup"
        # UNPACK ARCHIVE
        ssh -i $KEY $REMOTE_USER@$REMOTE_SERVER 'tar -xf $REMOTEDIR/update.tar; '
        check_errs $? "problem unpacking update"
        exit 0

