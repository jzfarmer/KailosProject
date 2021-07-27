# heatmaps and graphs for cancer types Match ARB
library(dplyr)
library(ggplot2)
library(pheatmap)
library(tibble)
# reading in the files
fragInfo <- read.table("methPanel_v3_fragInfo_sorted.txt", 
                       header = T, 
                       row.names = 1,
                       sep = '\t')
methRatio <- read.table("MatchARB/Match-AR-B Run Summary - MethRatio.tsv",
                        header = T,
                        row.names = 1,
                        sep = '\t')

# colnames(methRatio)[1] <- 'locus'
fragOrder_heatmaps = rownames(fragInfo)

# grab just cancer type columns from frag info.
fragInfo <- fragInfo[,c(1:14)]
# grab just the samples from the meth ratio file.
methRatio <- methRatio[,c(1:16)]

#rownames(methRatio) <- methRatio$locus
#methRatio[1] <- NULL

#rownames(fragInfo) <- fragInfo$locus
#fragInfo[1] <- NULL

# getting colors for our plots
annotationFeatures <- c(colnames(fragInfo),colnames(methRatio))

# colors to pick from
colorList <- c("aquamarine4","blue4","brown4","burlywood4","cadetblue4","chartreuse4","chocolate4","coral4","darkgoldenrod4","darkgreen",
               "darkmagenta","darkorange3","darkorchid4","darkred","darkslateblue","darkslategray","deeppink4","deepskyblue4","dodgerblue4", "firebrick3",
               "gray9","indianred3","hotpink3","purple4","navy","olivedrab4","magenta3","sienna","wheat4","turquoise4",
               "palevioletred3","salmon","cornflowerblue","palegreen4","maroon","green4","royalblue3","rosybrown4","orange","purple")

set.seed(1) # set seed to keep order of colors the same
colorList <- sample(colorList) # shuffle colors

my_ann_colors <- list()

for(i in seq(1,length(annotationFeatures),1)){
  feature = annotationFeatures[i]
  color = colorList[i]
  
  my_ann_colors[[feature]] = c("grey95",color)
  
  
}

rowFontSize=3
colFontSize=6
fontSize=6


# reorders the methRatio file
methRatio <- methRatio[fragOrder_heatmaps,]

methRatio_numeric <- as.matrix(methRatio)
methRatio_numeric <- log2(methRatio_numeric + 0.00001)


methAnnotation <- data.frame(Sample = factor(colnames(methRatio)))
rownames(methAnnotation) = factor(colnames(methRatio))
lociAnnotation <- data.frame(Prostate = fragInfo$PRAD, Pancreatic = fragInfo$PAAD,Liver = fragInfo$LIHC, LungAdeno = fragInfo$LUAD,
                             LungSquamous = fragInfo$LUSC, Bladder = fragInfo$BLCA, Colon = fragInfo$COAD, Rectal = fragInfo$READ, Uterine = fragInfo$UC, 
                             Ovarian = fragInfo$OV, Breast = fragInfo$BRCA,  Pancancer = fragInfo$PANCAN)
rownames(lociAnnotation) = factor(rownames(methRatio))
pheatmap(methRatio_numeric,
         main=paste("Methylation Ratio"), 
         fontsize_row=rowFontSize, 
         fontsize_col=colFontSize, 
         fontsize = fontSize,
         show_rownames = T, 
         cluster_cols=F, 
         cluster_rows=F, 
         color=colorRampPalette(c("navy","blue","white","red1"))(1000),
         annotation_col = methAnnotation, 
         annotation_row = lociAnnotation, 
         na_col = "snow4", 
         annotation_colors = my_ann_colors)


methRatioLog <- log2(methRatio + 0.00001)
methRatioHD <- methRatioLog[,c(13,4,11,16)] # looking at the log transformed scores for just the HD samples.
methRatio2815 <- methRatioLog[,c(3,2,1)] # looking at log scores for samples we know have cancer in them
