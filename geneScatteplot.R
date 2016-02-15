#From "Accounting for technical noise in single-cell RNA-seq experiments"
geneScatterplot <- function(x,y,xlab,ylab,col){
	plot(NULL,xlim=c(-.1,6.2),ylim=c(-1,6.2),
		 xaxt="n",yaxt="n",xaxs="i",yaxs="i",asp=1,
		 xlab=xlab,ylab=ylab)
	abline(a=-1,b=1,col="lightgray",lwd=2)
	abline(a=0,b=1,col="lightgray",lwd=2)
	abline(a=1,b=1,col="lightgray",lwd=2)
	abline(h=c(0,2,4,6),v=c(0,2,4,6),col="lightgray",lwd=2)
	points(
		   ifelse(x>0,log10(x),-.7),
		   ifelse(y>0,log10(y),-.7),
		   pch=19,cex=.2,col=col)
	axis(1,c(-.7,0:6),
		 c("0","1","10","100",expression(10^3),expression(10^4),
		   expression(10^5),expression(10^6)))
	axis(2,c(-.7,0:6),
		 c("0","1","10","100",expression(10^3),expression(10^4),
		   expression(10^5),expression(10^6)),las=2)
	axis(1,-.35,"//",tick=FALSE,line=-.7)
	axis(2,-.35,"\\\\",tick=FALSE,line=-.7)
}
