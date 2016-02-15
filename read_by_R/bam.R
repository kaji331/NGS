# Choosing rld or dds for clustering and visualization need more considerations.

setwd("~/Projects/NGS/read_by_R/")
load("bam.rda")
pos <- regexpr("C[0-9]+(.*?)mapping",colnames(fc$counts))
m <- regmatches(colnames(fc$counts),pos)
colnames(fc$counts) <- gsub("C(.*?)_C(.*?)_[A-Z]+\\.[A-Z]+_(.*?)_R1_00(.*?)_mapping",
                            "C\\2_00\\4",m)
fc$counts <- fc$counts[rowSums(fc$counts) != 0,]
plot(as.factor(colnames(fc$counts)),colSums(fc$counts))

library(DESeq2)
sample <- read.csv("sample.csv")
dds.fc <- DESeqDataSetFromMatrix(fc$counts,colData=sample,design=~sample_id)
dds <- estimateSizeFactors(dds.fc)
rld <- rlog(dds)
plotPCA(rld,intgroup="sample_id")
plot(hclust(dist(t(assay(rld)))),labels=colData(rld)$sample_id,
     cex=.8,xlab="Sample_Cells",main="Clustering",family="serif",cex.main=2,sub=" ")
library(mlass)
plot(kMeans(assay(rld),centers=2),trace=F)

# density peak clustering
library(densityClust)
Clust <- dist(t(assay(dds)))
Clust <- densityClust(Clust,gaussian=T)
# rho is -1 for all centers or outliers, delta is the threshold for outliers
Clust <- findClusters(Clust,rho=-1,delta=median(Clust$delta)+mad(Clust$delta))
plotMDS(Clust)
split(colnames(fc$counts),Clust$clusters)

# t-SNE
library(Rtsne)
mydata <- assay(rld)
rtsne_out <- Rtsne(t(mydata))
# setting colors by hclust
color1 <- 1:94
color1 <- as.character(color)
color1[h$order[1:5]] <- "black"
color1[h$order[6:38]] <- "red"
color1[h$order[39:94]] <- "blue"
# setting colors by density peak
color2 <- rainbow(17)[Clust$clusters]

# exporting jpg file
# jpeg("tsne-plot.jpg",width=2400,height=1800)

# plot1
plot(rtsne_out$Y,t='n',main="Cell-tSNE by hclust",family="serif")
text(rtsne_out$Y,labels=colnames(mydata),col=color1,
     family="serif",cex=0.5)

# plot2
plot(rtsne_out$Y,t='n',main="Cell-tSNE by density peak",family="serif")
text(rtsne_out$Y,labels=colnames(mydata),col=color2,
     family="serif",cex=0.5)

# dev.off()