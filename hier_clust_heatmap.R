#Creation of a matrix that contains the positions that hold the "DEG_list" genes in the "genevalues" matrix
z<-matrix(NA,length(DEG_list),1)
for(i in 1:length(DEG_list)){
  z[i,1]<-which(rownames(genevalues)==DEG_list[i,1])}
head(z)

#Creation of a matrix that contains only the logFC values of the differentially expressed genes
heatdata<-matrix(NA,length(DEG_list),5)
rownames(heatdata)<-DEG_list
colnames(heatdata)<-c("TG","TherA","TherB","TherC","TherD")
for (i in 1:length(z)){
  heatdata[i,1]<-genevalues[z[i,1],1]
  heatdata[i,2]<-genevalues[z[i,1],3]
  heatdata[i,3]<-genevalues[z[i,1],5]
  heatdata[i,4]<-genevalues[z[i,1],7]
  heatdata[i,5]<-genevalues[z[i,1],9]
}
head(heatdata)

#Activation of the needed libraries to visualize the heatmap with a bit more interesting colours
library(gplots)
library("RColorBrewer")
cols<- colorRampPalette(brewer.pal(11, "Spectral"))(25)
heatmap.2(heatdata,col=cols,cexCol=1.2,main="Differentially Expressed Genes")
