# z strings in blood markers
# packages that we need to make graphs
library(ggplot2)
library(reshape)
library(pheatmap)
# reads in frag info file
# not sure if we need the frag info file for this but added it in just in case
fragInfo <- read.table("methPanel_v3_fraginfo.txt",
                       header = T, 
                       row.names = 1, 
                       sep = '\t')

# reorders fragments for the plot and heatmaps
fragOrder_molDepthPlot <- fragInfo[with(fragInfo, order(fragOrder)),]
fragOrder_molDepthPlot <- row.names(fragOrder_molDepthPlot)

fragOrder_heatmaps <- rownames(fragInfo)

# read in the 30 ng and 100 ng blood loci files
thirtyng <- read.table("blood_markers_methylation_30ng.txt", 
                       header = T, 
                       row.names = NULL, # have to use row names = null because there are duplicate row names
                       sep = '\t')
onehundredng <- read.table("blood_markers_methylation_100ng.txt", 
                       header = T, 
                       row.names = NULL, # have to use row names = null because there are duplicate row names
                       sep = '\t')
# for some reason there's extra columns--let's clean this up
thirtyng <- thirtyng[,c(1:8)]
onehundredng <- onehundredng[,c(1:8)]
# rename the z string column since
colnames(thirtyng)[4] <- "numeric_z_string"
colnames(onehundredng)[4] <- "numeric_z_string"
?kmeans
# z strings were replaced to be numeric. 'Z' = 1, and 'z' = 1 
# trying to clutster now by numeric z string
# nstart indicates that R will try 25 random assignments and then pick the best results
clusters30ng <- kmeans(thirtyng[,4], 10, nstart = 25)
clusters100ng <- kmeans(onehundredng[,4], 10, nstart = 25)

# add the cluster number as column in the data
thirtyng$Cluster <- as.factor(clusters30ng$cluster)
onehundredng$Cluster <- as.factor(clusters100ng$cluster)

# plotting 30 ng
ggplot(data = thirtyng) +
  geom_point(mapping = aes(x = locus, y = Cluster))
