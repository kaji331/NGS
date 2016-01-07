#!/bin/bash

f1=$(echo $1 | sed 's/\(.*\)\\n/\1/')
f2=$(echo $2 | sed 's/\(.*\)\\n/\1/')
name=$(echo $f1 | sed 's/\(.*\)-I_1_trimmed.fq/\1\_mapping/')
tophat -p "16" -o "$name" -G "/share/home/xierf/Yang_L/Ref_hg38/GENCODE_GRCh38.p2/gencode.v22.annotation.gtf" "/share/home/xierf/Yang_L/Ref_hg38/GENCODE_GRCh38.p2/GRCh38.p2.genome" "$f1" "$f2"
