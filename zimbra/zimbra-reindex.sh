#!/bin/bash
#############################################################################
##
##  file   : zimbra-reindex.sh
##  author : richard klein leugemors
##  remark : tool to reindex all available zimbra mailboxes
##
#############################################################################


# ---------------------------------------------------------------------------
# first check if we are the user zimbra
# ---------------------------------------------------------------------------

if [ $USER != "zimbra" ]
then
	echo -e "\nERROR: Please run this script as the zimbra user (su - zimbra).\n"
	exit 2
fi

# ---------------------------------------------------------------------------
# check the parameters and print a help text if necessary
# ---------------------------------------------------------------------------

echo -e "\nZIMBRA REINDEX"
echo -e "--------------\n"
echo -e "Tool to automagically reindex all available zimbra mailboxes.\n"

JOB=$1
case $JOB in
	start)  echo "Reindexing all available zimbra mailboxes..." ;;
	status) echo "Checking the status of the reindexing process..." ;;
	cancel) echo "Cancel the current reindex job..." ;;
	*)      echo -e "Usage: $0 [start|status|cancel]\n"; exit 1 ;;
esac

# ---------------------------------------------------------------------------
# start the process
# ---------------------------------------------------------------------------

echo "Creating a list of all mailboxes..."
MAILBOXES=`zmprov -l gaa`

echo "Creating temp files..."
for MAILBOX in $MAILBOXES
do
	echo "rim $MAILBOX $JOB" >> /tmp/rim_$JOB.txt
done

echo "Work in progress..."
zmprov -f /tmp/rim_$JOB.txt

echo "Remove the temp files..."
rm /tmp/rim_$JOB.txt

echo "All done!"

### EOF #####################################################################
