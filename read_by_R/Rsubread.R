load("bam.rda")
library(Rsubread)
fc <- featureCounts(bam.files,annot.ext=gtf.file,
                    isGTFAnnotationFile=T,
                    isPairedEnd=F,
                    nthreads=8)
# fc_SE <- featureCounts(SE_bam_files, annot.ext="unique.gff",
#                        isGTFAnnotationFile=TRUE,
#                        GTF.featureType="exon", GTF.attrType="ID",
#                        useMetaFeatures=FALSE, allowMultiOverlap=TRUE)
save(list=objects(),file="bam.rda")