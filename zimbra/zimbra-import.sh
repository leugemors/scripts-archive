#!/bin/bash

zmmailbox -z -m $1 postRestURL "//?fmt=tgz&reslove=reset" $1.tar.gz
