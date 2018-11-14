#! /bin/bash
# Remote Update
# Paul Hartman
#
# Program used to update web site from development system. Replacement for update.sh
# I'll just go ahead and say it. I'm occasionally a dammed moron. Much more elegant.
rsync -vrze ssh ~/local/directory username@server.com:/remote/directory

# For passwordless access to work, setup cofig file in .ssh/config file
# Host hostname
#     User username
#     IdentityFile ~/.ssh/somekey
