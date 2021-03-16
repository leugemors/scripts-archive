#!/bin/bash

# We create them all, but uzori.com !!!

DOMAINS=`cat /usr/local/etc/domains | grep -v "uzori.com"`
WHERE="/var/cache/bind"

echo -e "\nRe-creating all zone files...\n"

for DOMAIN in $DOMAINS
do
	echo "Creating: db.$DOMAIN.zone"
	bind-create-zone.sh $DOMAIN > $WHERE/db.$DOMAIN.zone
done

echo -e "\nDone...\n"
echo "Please also regenerate the keys !!!"
echo -e "And don't forget to restart bind !!!\n"
