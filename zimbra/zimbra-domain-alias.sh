#!/bin/bash
#
# Execute as zimbra user

DOMAIN_OLD="kleinleugemors.com"
DOMAIN_NEW="kleinleugemors.nl"

echo "Creating alias domain $DOMAIN_NEW for the existing domain $DOMAIN_OLD"

zmprov cd $DOMAIN_NEW zimbraDomainType \
       alias zimbraMailCatchAllAddress @$DOMAIN_NEW \
       zimbraMailCatchAllForwardingAddress @$DOMAIN_OLD 
