#!/bin/bash

ACCOUNT=$1

if [ -z $ACCOUNT ]; then
  echo "Please provide an e-mail address."
  exit 1
fi

su - zimbra -c 'zmprov ma $ACCOUNT zimbraAccountStatus active'
