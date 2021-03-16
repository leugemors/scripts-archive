#!/bin/bash

echo Restoring: $1

zmmailbox -z -m $1 postRestURL "/?fmt=tgz&resolve=reset" $1.tar.gz
