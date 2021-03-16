#!/bin/bash

PHOTOS=$(ls *.jpg *.JPG)

for P in $PHOTOS
do
	convert -resize 350x233 -quality 85% $P s_$P
done
