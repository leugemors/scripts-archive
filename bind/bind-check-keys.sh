#!/bin/bash

DOMAIN=$1
WHERE="/var/cache/bind"

echo "Checking domain $DOMAIN..."

donuts --level 8 -v $WHERE/db.$DOMAIN.zone.signed $DOMAIN
