#!/bin/sh

IFS=$(echo -en "\n\b")
for i in `find .. -iname "*_all.fastq" -print`
do
	name=$(echo $i | sed 's/\_all\.fastq/\_trimmed\_all\.fastq/')
	trimmed_name=$(echo $i | sed 's/\/\(.*\)\_all\.fastq/\/Trimmed\_\1\_trimmed\_all\.fastq/')
	java -jar "trimmomatic-0.33.jar" "SE" -phred33 -threads "8" -trimlog "$name\.log" "$i" "$trimmed_name" "ILLUMINACLIP:TruSeq3-SE.fa:2:20:10" "ILLUMINACLIP:SmartSeq.fa:2:20:10" "HEADCROP:14" "LEADING:20" "TRAILING:20" "SLIDINGWINDOW:4:20" "MINLEN:50"
done
