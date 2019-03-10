#!/bin/bash

# 3902-r00223-0
function download(){
	PART1=http://codh.rois.ac.jp/north-china-railway/iiif/original/
	PART2=.tif/full/full/0/default.jpg
	FN=./images/$1.jpg
	if [ -f ${FN} ]; then
	  echo skip ${FN}
	else
	  curl ${PART1}$1${PART2} --output ${FN}
	fi
}

export -f download
cat id.txt | xargs -n 1 -P 10 -I@ bash -c 'download @'
