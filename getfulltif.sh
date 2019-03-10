#!/bin/bash

# 3902-r00223-0
PART1=http://codh.rois.ac.jp/north-china-railway/iiif/original/
PART2=.tif/full/full/0/default.jpg

for i in $(cat id.txt); do
  FN=${i}.jpg
  if [ -f ${FN} ]; then
    echo skip ${FN}
  else
    curl ${PART1}$i${PART2} --output ${FN}
    #sleep 1
  fi
done
