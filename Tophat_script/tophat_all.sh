#!/bin/sh

IFS=$(echo -en "\n\b")
for i in `find .. -iname "*_trimmed.fastq.gz" -print`
do
	name=$(echo $i | sed 's/\_trimmed.fastq.gz/\_mapping/')
	tophat -p "8" -o "$name" -G "/share/home/xierf/Yang_L/Ref_hg38/NCBI_GRCh38/GCA_000001405.15_GRCh38_full_analysis_set.refseq_annotation.gff" "/share/home/xierf/Yang_L/Ref_hg38/NCBI_GRCh38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index" "$i"
done
