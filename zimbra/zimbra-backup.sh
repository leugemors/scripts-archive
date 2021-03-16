#!/bin/bash
#############################################################################
##
##  backup all zimbra mailboxes
##
#############################################################################

PREFIX="/opt/zimbra"
WHERE="$PREFIX/backup"
PATH="$PREFIX/bin:$PATH"
DATE=$(date +%Y-%m-%d)

MAILTO="richard@uzori.com"
REMOTE_USER="richard"
REMOTE_SYSTEM="hosting2.uzori.com"
REMOTE_DIR="/backup/hosting5"

#----------------------------------------------------------------------------
# create a list of all zimbra accounts
#----------------------------------------------------------------------------

ACCOUNTS=$(zmprov -l gaa | \
  sort | \
  grep -v ^galsync | \
  grep -v ^ham\. | \
  grep -v ^spam\. | \
  grep -v ^testing | \
  grep -v ^virus-quarantine)

#----------------------------------------------------------------------------
# create a directory for the config
#----------------------------------------------------------------------------

mkdir -p $WHERE/config
if [ $? != 0 ]; then
  echo "ERROR: Could not create directory $WHERE/config"
  exit 1
fi

#----------------------------------------------------------------------------
# create a backup file per account
#----------------------------------------------------------------------------

{ TIME=$(date)
printf "Start backup of Zimbra at: ${TIME}\n\n"

for ACCOUNT in $ACCOUNTS; do
  echo Creating backup for: $ACCOUNT
  zmmailbox -z -m $ACCOUNT getRestURL '/?fmt=tgz' > $WHERE/$ACCOUNT.tar.gz
  zmprov getAccount $ACCOUNT > $WHERE/config/$ACCOUNT.config
done

TIME=$(date)
printf "\nEnd backup of Zimbra at: ${TIME}\n"

} | mail -s "Backup zimbra at $DATE" $MAILTO

#----------------------------------------------------------------------------
# copy backup to another system
#----------------------------------------------------------------------------

ssh $REMOTE_USER@$REMOTE_SYSTEM "mkdir -p /$REMOTE_DIR/$DATE/config"
scp $WHERE/*.tar.gz $REMOTE_USER@$REMOTE_SYSTEM:$REMOTE_DIR/$DATE
scp $WHERE/config/*.config $REMOTE_USER@$REMOTE_SYSTEM:$REMOTE_DIR/$DATE/config

printf "\nDone...\n"

### EOF #####################################################################
