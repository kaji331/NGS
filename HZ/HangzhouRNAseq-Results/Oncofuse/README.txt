这个目录下有两个子目录。
oncofuse_prediction 包含了一系列的 CSV 文档。
每个文档含有一下8列内容。They are:

	SAMPLE_ID: sample ID provided by customer.
	GENOMIC: chromosomal coordinates for both breakpoints
        5_FPG_GENE_NAME:  The HGNC symbol of 5' fusion partner gene
	5_SEGMENT_TYPE:	Indicates whether breakpoint is located within either exon or intron
	3_FPG_GENE_NAME: The HGNC symbol of 3' fusion partner gene
	3_SEGMENT_TYPE: Indicates whether breakpoint is located within either exon or intron
	P_VAL_CORR: The Bayesian probability of fusion being a passenger, given as Bonferroni-corrected P-value
	DRIVER_PROB: The Bayesian probability of fusion being a driver
	可以选择p值小于0.05或者0.01的作为候选基因。



