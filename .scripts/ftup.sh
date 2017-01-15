#!/bin/sh

HOST='ftp.eti.tf'
USER='wby0nz_eti'
REMOTEPATH='/pub'
YELLOW='\033[1;33m'
PURPLE="\033[0;35m"
NC='\033[0m'

echo -e "$YELLOW"
read -rp "Local file path
> " FILEPATH

read -rp "Remote file path
> " FILENAME
echo -e "$NC"

ftp -n $HOST <<END_SCRIPT

user $USER
cd $REMOTEPATH
put $FILEPATH $FILENAME
quit

END_SCRIPT

echo
echo -e "$PURPLE Uploaded $FILENAME $NC"
echo -e "$YELLOW Link: http://pub.eti.tf/$FILENAME $NC"
echo

exit 0
