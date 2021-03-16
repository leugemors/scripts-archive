#!/bin/bash

su - zimbra -c 'zmprov -l gaa | grep -v ^galsync | grep -v ^spam | grep -v ^virus | grep -v ^ham | sort'
