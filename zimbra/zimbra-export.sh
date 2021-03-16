#!/bin/bash

su - zimbra -c 'zmmailbox -z -m $1 getRestURL "//?fmt=tgz" > $1.tar.gz'
