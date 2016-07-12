#!/usr/bin/env bash

# Grab exons, e.g. via GENCODE:
wget ftp://ftp.sanger.ac.uk/pub/gencode/Gencode_human/release_19/gencode.v19.annotation.gtf.gz
gunzip -c gencode.v19.annotation.gtf.gz \
	| gtf2bed - \
	| grep "exon" \
	> gencode.exons.hg19.bed

# Use bedtools and awk to get intersection of two bed files:
bedtools intersect -a final_pos.bed -b gencode.exons.hg19.bed -wb \
	| awk -v OFS="\t" '{print $1,$2,$3,$22}' \
	> answer.bed

