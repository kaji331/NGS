#!/bin/sh

IFS=$(echo -en "\n\b")
for i in `find .. -iname "*_trimmed.fastq.gz" -print`
do
	name=$(echo $i | sed 's/\_trimmed.fastq.gz/\_mapping/')
	mkdir -p "$name"
	tophat -p "8" -o "$name" --bowtie1 --fusion-search "/share/home/xierf/Yang_L/Ref_hg38/hg38_index/hg38" "$i"
done
