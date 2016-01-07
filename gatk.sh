#!/bin/bash

source /share/home/xierf/.profile

#f=$(echo $1 | sed 's/\(.*\)\\n/\1/')
f=$(echo $1 | sed 's/\(.*\)/\1/')

#date
java -Xmx6G -jar /share/home/xierf/Yang_L/picard-tools-1.137/picard.jar AddOrReplaceReadGroups \
	INPUT=$f \
	OUTPUT=$(basename $f .bam)\_gp.bam \
	ID=$(echo $f | sed 's/.\/\(.*\)-\(.*\)/\1/') \
	LB=$(echo $f | sed 's/.\/\(.*\)-\(.*\).s\(.*\)/\2/') \
	PL=illumina \
	PU=unknown \
	SM=$(echo $f | sed 's/.\/\(.*\)-\(.*\)/\1/') \
	TMP_DIR=/share/home/xierf/KY049/BAM/tmp/

java -Xmx6G -jar /share/home/xierf/Yang_L/picard-tools-1.137/picard.jar ReorderSam \
	INPUT=$(basename $f .bam)\_gp.bam \
	OUTPUT=$(basename $f .bam)\_gp\_ro.bam \
	REFERENCE=/share/home/xierf/Yang_L/GATK/ucsc.hg19.fasta \
	TMP_DIR=/share/home/xierf/KY049/BAM/tmp/

rm $(basename $f .bam)\_gp.bam
samtools index $(basename $f .bam)\_gp\_ro.bam

java -Xmx16G -jar /share/home/xierf/Yang_L/GATK/GenomeAnalysisTK.jar \
	-T HaplotypeCaller \
	-R /share/home/xierf/Yang_L/GATK/ucsc.hg19.fasta \
	-I $(basename $f .bam)\_gp\_ro.bam \
	-ERC GVCF \
	-o $(basename $f .bam).g.vcf

rm $(basename $f .bam)\_gp\_ro.bam
rm $(basename $f .bam)\_gp\_ro.bam.bai

# gzip $(basename $f .bam)\_gatk.vcf

#date
