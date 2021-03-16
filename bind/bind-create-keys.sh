#!/bin/bash
#############################################################################
##
##  file   : bind-create-keys.sh
##  author : richard klein leugemors
##  remark : creating and/or resigning keys for dnssec
##
#############################################################################

# import list of domain names
DOMAINS=`cat /usr/local/etc/domains`

WHERE="/var/cache/bind"
cd $WHERE

# create the keys
for DOMAIN in $DOMAINS
do
	zonesigner -genkeys -usensec3 -zone $DOMAIN $WHERE/db.$DOMAIN.zone
done

# restart the dns server
/etc/init.d/bind9 restart

# go back to where we came from
cd -

### EOF #####################################################################
