#!/bin/sh

for i in `find .. -name "accepted_hits.bam" -print`
do
	rename_bam=$(echo $i | sed 's/\(.*\)\/accepted_hits\.bam/\1\.bam/')
	cp $i $rename_bam
done
find .. -name "*_mapping.bam" -print > bam.txt
