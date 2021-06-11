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
thirtyng <- read.table("blood_30ng.txt", 
                       header = T, 
                       row.names = NULL, # have to use row names = null because there are duplicate row names
                       sep = '\t')
onehundredng <- read.table("blood_100ng.txt", 
                       header = T, 
                       row.names = NULL, # have to use row names = null because there are duplicate row names
                       sep = '\t')
# for some reason there's extra columns--let's clean this up
thirtyng <- thirtyng[,c(1:8)]
onehundredng <- onehundredng[,c(1:8)]
# rename the z string column since it was named strangely upon import
colnames(thirtyng)[4] <- "ZString"
colnames(onehundredng)[4] <- "ZString"
# in the dataframes, change the characters to numeric values
# the graphing functions dont like non-numeric characters
# this assigns a unique number to each value
thirtyng$sample = as.numeric(as.factor(thirtyng$sample))
thirtyng$locus = as.numeric(as.factor(thirtyng$locus))
thirtyng$UMI = as.numeric(as.factor(thirtyng$UMI))
thirtyng$ZString =as.numeric(as.factor(thirtyng$ZString))
onehundredng$sample = as.numeric(as.factor(onehundredng$sample))
onehundredng$locus = as.numeric(as.factor(onehundredng$locus))
onehundredng$UMI = as.numeric(as.factor(onehundredng$UMI))
onehundredng$Zstring = as.numeric(as.factor(onehundredng$ZString))
?kmeans
# elbow plot to determine the optimal number of clusters
# it looks like it is 2 from the graph but not sure this
# makes sense
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(onehundredng, nc=4) 
wssplot(thirtyng, nc=4) 
# trying to scale the data to see if this makes a difference
thirtyng <- scale(thirtyng)
onehundredng <-scale(onehundredng)
# z strings were replaced to be numeric. 'Z' = 1, and 'z' = 1 
# trying to clutster now by numeric z string
# nstart indicates that R will try 25 random assignments and then pick the best results
# set a seed so the results are consistent
set.seed(1234)
clusters30ng <- kmeans(thirtyng[,4], 2, nstart = 25)
clusters100ng <- kmeans(onehundredng[,4], 2, nstart = 25)

# add the cluster number as column in the data
thirtyng$Cluster <- as.factor(clusters30ng$cluster)
onehundredng$Cluster <- as.factor(clusters100ng$cluster)


# plotting 30 ng
library(tidyverse)
library(cluster)
install.packages("factoextra")
library(factoextra)
?fviz_cluster
fviz_cluster(clusters30ng, 
             data = thirtyng, 
             geom = c("point"),
             choose.vars = c("locus", "ZString", "methCGs","methRatio","totalCGs","numReads"),
             ellipse.type = "euclid",
             main = "Clustering of 30 ng samples by z-string")

#100ng plot
fviz_cluster(clusters100ng, 
             data = onehundredng, 
             geom = c("point"),
             choose.vars = c("locus", "Zstring", "methCGs","methRatio","totalCGs","numReads"),
             ellipse.type = "euclid",
             main = "Clustering of 100 ng samples by z-string")

library(cluster)
clusplot(thirtyng, clusters30ng$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

clusplot(onehundredng, clusters100ng$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

