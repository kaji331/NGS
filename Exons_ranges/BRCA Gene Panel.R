library(TxDb.Hsapiens.UCSC.hg19.knownGene)
knownGene <- TxDb.Hsapiens.UCSC.hg19.knownGene
exon <- exonsBy(knownGene,"gene")
library(rtracklayer)
refGene <- import.bed("UCSC_Main_on_Human_refGene.bed",asRangedData=F)
panel <- import.bed("YangLing_BrCA_et_al_19_Genes.bed",asRangedData=F)
AR <- "NM_000044"
AR_ranges <- mcols(refGene)$name %>>% (grep(AR,.)) %>>% (refGene[.,])
