
RSEM
	这个文件夹中的文件是对gene和transcript(isoforms)的abundance进行计算的结果。

	文件夹中的*txt压缩文件 （解压之后用excel表格打开;选择tab分隔符）是RSEM对每个样本的transcripts (isoforms.results)或者genes (genes.results)表	达量的计算结果。

	表达量的是用FPKM衡量的。FPKM在之后的差异表达分析中用到（实际做了进一步处理以边样本间比较）。

	FPKM 是Fragemnts per kilobase of exon per million reads mapped 的缩写。
	可以理解为：‘测了1百万个reads，则平均每kb exon被覆盖FPKM次。
	这个参数在
	https://haroldpimentel.wordpress.com/2014/05/08/what-the-fpkm-a-review-rna-seq-expression-units/
	有详细介绍。


	pdf图形文件都是为了直观地反映‘有多少transcripts表达了？’
	cumulplot.R 是用来画图的r代码。

