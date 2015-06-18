#!/bin/sh

IFS=$(echo -en "\n\b")
for i in `find .. -iname "*.fastq.gz" -print`
do
	name=$(echo $i | sed 's/\.fastq.gz/\_trimmed.fastq.gz/')
	trimmed_name=$(echo $i | sed 's/\/\(.*\)\.fastq.gz/\/Trimmed\_\1\_trimmed.fastq.gz/')
	java -jar "trimmomatic-0.33.jar" "SE" -phred33 -threads "8" -trimlog "$name.log" "$i" "$trimmed_name" "ILLUMINACLIP:TruSeq3-SE.fa:2:30:10" "ILLUMINACLIP:SmartSeq.fa:2:30:10" "HEADCROP:14" "LEADING:30" "TRAILING:30" "SLIDINGWINDOW:4:30" "MINLEN:50"
done
