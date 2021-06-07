# packages that we need to make graphs
library(ggplot2)
library(reshape)
library(pheatmap)
# reads in frag info file
fragInfo <- read.table("methPanel_v3_fraginfo.txt", header = T, row.names = 1, sep = '\t')

# reorders fragments for the plot and heatmaps
fragOrder_molDepthPlot <- fragInfo[with(fragInfo, order(fragOrder)),]
fragOrder_molDepthPlot <- row.names(fragOrder_molDepthPlot)

fragOrder_heatmaps <- rownames(fragInfo)

# reads in the sample statistics file
sampleStats <- read.table(file = "Match_AL_runStatistics.txt", header = T, row.names = 1, sep = "\t")

# renames samples to start with an X if they start with an integer.
# this is just to keep things consistent across files, as R will automatically
# add X's 
newSampleStatsRowNames <- formatNames(rownames(sampleStats))
rownames(sampleStats) <- newSampleStatsRowNames

# reading in the other input files
totalMolFile <- read.table("Match_AL_totalMolecules.txt", header = T, row.names = 1, sep = "\t")
totalMolFile <- totalMolFile[fragOrder_heatmaps,] # only grab frags in info file - we only want to plot these

methMolFile <- read.table("Match_AL_methylatedMolecules.txt",header = T, row.names = 1, sep = "\t")
methMolFile <- methMolFile[fragOrder_heatmaps,]

methRatioFile <- read.table("Match_AL_methylationRatio.txt",header = T, row.names = 1, sep = "\t")
methRatioFile <- methRatioFile[fragOrder_heatmaps,]


# grabbing the oncocytes we want to plot
oncSampleStats <- sampleStats[c(12,5,10),]
oncTotalMol <- totalMolFile[,c(12,5,10)]
oncMethMol <- methMolFile[,c(12,5,10)]
oncMethRatio <- methRatioFile[,c(12,5,10)]

# getting colors for our plots
annotationFeatures <- c(colnames(fragInfo),colnames(sampleStats))

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

# total molecules plot
colNamesOncTotalMol <- colnames(oncTotalMol)
colNamesOncTotalMol <- c("Locus",colNamesOncTotalMol) # adds locus as a column name
oncTotalMol$Locus <- rownames(oncTotalMol)
oncTotalMol <- oncTotalMol[,colNamesOncTotalMol] # locus is now the first column
rownames(oncTotalMol) = NULL # takes out the loci as being the row names, and they are now just 1,2,3,4, etc

# makes the total molecules file into a long dataframe
# the data frame now has 3 columns--fragment, sample, and molecules. each sample
# is represented multiple times across the rows. this is why it's a 'long' dataframe
meltedMol <- melt(oncTotalMol)
colnames(meltedMol) <- c("Fragment","Sample","Molecules")

# changes all the NA's to 1s because we are plotting on a log scale.
meltedMol[is.na(meltedMol) ] = 1

runName <- "Match_AL_Oncocytes"

totalMolPlotName <- paste(runName,"_totalMoleculesPlot.pdf",sep="")

ggplot(meltedMol, aes(x=factor(Fragment), y=Molecules, fill=factor(Sample))) +
  ggtitle(paste(runName,"Unique Molecules")) +
  xlab("Fragment") + 
  scale_fill_discrete(name = "Sample") +
  geom_dotplot(binaxis = "y", dotsize=0.4) +
  scale_x_discrete(limits=fragOrder_molDepthPlot) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 0.01, color = "white")) +
  scale_y_log10(limits = c(1,10000)) # scales the y axis by log10

# heatmaps

rowFontSize <- 3
colFontSize <- 6
fontSize <- 2

# if(ncol(methMolFile)>25 && ncol(methMolFile)<40){
  # colFontSize=4
#}
# else if(ncol(methMolFile)>=40){
  # colFontSize=3
#}

#if(nrow(fragInfo)>160){
  rowFontSize=2
#}

  
rownames(oncTotalMol) <- oncTotalMol$Locus
oncTotalMol$Locus=NULL

fragInfo$fragOrder=NULL

totalMolHeatmapName <- paste(runName,"_totalMoleculesHeatmap.pdf",sep = "")
# total molecules heatamp

pheatmap(log2(oncTotalMol[fragOrder_heatmaps,]+1),
         main = paste(runName,"Aligned Molecules (log2)"),  
         fontsize_row = rowFontSize, 
         fontsize_col = colFontSize,
         fontsize = fontSize,
         show_rownames = T, 
         cluster_cols = F, 
         cluster_rows = F, 
         color = colorRampPalette(c("navy","yellow","forestgreen","darkgreen"))(50),
         annotation_col = sampleStats, 
         annotation_row = fragInfo, 
         na_col = "snow4", annotation_colors = my_ann_colors)
pdf(totalMolHeatmapName)


# methylated molecules heatmap

methMolHeatmapName=paste(runName,"_methylatedMoleculesHeatmap.pdf",sep = "")

pheatmap(log2(oncMethMol[fragOrder_heatmaps,]+1), 
         main=paste(runName,"Methylated Molecules (log2)"), 
         fontsize_row=rowFontSize, 
         fontsize_col=colFontSize, 
         fontsize = fontSize,
         show_rownames = T, 
         cluster_cols=F, 
         cluster_rows=F, 
         color=colorRampPalette(c("navy","white","firebrick3","firebrick4"))(50),
         annotation_col = sampleStats,
         annotation_row = fragInfo,
         na_col = "snow4", 
         annotation_colors = my_ann_colors)
pdf(methMolHeatmapName)
dev.off()

# methylation ratio heatmap
methRatioHeatmapName=paste(runName,"_methylationRatioHeatmap.pdf",sep = "")

pheatmap(oncMethRatio[fragOrder_heatmaps,], 
         main=paste(runName,"Methylation Ratio"), 
         fontsize_row=rowFontSize, 
         fontsize_col=colFontSize, fontsize = fontSize,
         show_rownames = T, 
         cluster_cols=F, 
         cluster_rows=F, 
         color=colorRampPalette(c("navy","white","sienna1","sienna2","sienna3","sienna","sienna4"))(50),
         annotation_col = sampleStats, 
         annotation_row = fragInfo, 
         na_col = "snow4", 
         annotation_colors = my_ann_colors)
pdf(methRatioHeatmapName)