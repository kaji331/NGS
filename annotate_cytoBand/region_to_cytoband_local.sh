#!/bin/bash

# Example bash region_to_cytoband_local.sh chr1 1 100
bedops -e 1 cytoBand_hg19.txt <(echo -e "${1}\t${2}\t${3}")
