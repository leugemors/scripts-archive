#!/bin/bash

cat /var/log/mail.log | grep "Relay access denied" | cut -d"<" -f2 | cut -d">" -f1 | sort | uniq | less
