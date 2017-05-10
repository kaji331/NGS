#!/bin/bash

# Example: bash cytoband_to_region_local.sh chr17 p13.3
grep "^${1}" cytoBand_hg19.txt | grep "${2}"
