#! /bin/bash

# Update.sh
# by Paul Hartman
#

## This script is to automatate the updateing of the main
## website. Upload package should be an uncompressed tarball named upload.tar
## Drop it in the upload folder.

# Name and location of the backup file
CONDOM=/home/ubuntu/backups/hartman-$(date +%Y%m%d).tar
# Upload loacation and file
UPLOAD=/home/ubuntu/upload
# Publishing location
FINAL=/var/www/resume/
# Package Name (haven't figured out how to use this yet)
TARBALL=update.tar

# Internal Stuff
HI="$UPLOAD/$TARBALL"
FI="$FINAL/$TARBALL"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
if [ -e $HI ]
   then
	echo "backing up Website"
	tar -cf $CONDOM $FINAL
	#echo "Moving Tarball" Not used anymore
	#mv $HI $FI
	echo "Extracting Tarball"
	tar -xf $HI $FI
	echo "Deleting Tarball"
	rm $HI
	echo "Congratulations! Your website has been updated"


else
  echo "Your update is not present in the upload folder."
  echo "Please check your update and try again."
fi
