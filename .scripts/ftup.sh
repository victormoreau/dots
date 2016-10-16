#!/bin/bash

HOST='ftp.eti.tf'
USER="wby0nz_eti"
REMOTEPATH='/pub'
YELLOW='\033[1;33m'
PURPLE="\033[0;35m"
NC='\033[0m'

echo -e "${YELLOW}Local file path:"

read FILEPATH

echo -e "Remote file name:"

read FILENAME

echo -e "${NC}"

ftp -n $HOST <<END_SCRIPT

user $USER
cd $REMOTEPATH
put $FILEPATH $FILENAME
quit

END_SCRIPT

echo
echo -e ${PURPLE}Uploaded $FILENAME
echo -e ${YELLOW}Link: http://pub.eti.tf/$FILENAME
echo

exit 0
