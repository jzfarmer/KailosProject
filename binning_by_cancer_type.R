# binning & cancer type
library(dplyr)
library(reshape)
library(binr)
library(ggplot2)
# read in the frag info file for each loci and its respective associated cancer type.
fragInfo <- read.table("methPanel_v3_fraginfo.txt", 
                       header = T, 
                       row.names = NULL, # null so that each locus is not a row name.
                       sep = '\t')
# read in the file for the sample/run of interest.
HD806_100ng_25X_S1_S2 <- read.table("MatchAP/all_molecules/HD806-100ng-25X-S1-S2_allMolecules.txt", 
                       header = T, 
                       row.names = NULL, 
                       sep = '\t')


HD806_100ng_25X_S1_S2 <- HD806_100ng_25X_S1_S2[!HD806_100ng_25X_S1_S2$numReads < 5,] # filters out any reads less than 5
HD806_100ng_25X_S1_S2 <- HD806_100ng_25X_S1_S2[!(HD806_100ng_25X_S1_S2$methRatio < 0.70),] # filters out any amplicons that had a methRatio < 0.70. 


fragInfo <- fragInfo[,c(1:14)]
# remove the sample column
HD806_100ng_25X_S1_S2 <- HD806_100ng_25X_S1_S2[,c(2:8)]
# get the total number of loci in the fraginfo file
length_fragInfo <- length(as.factor(fragInfo$locus))

# separate the frag info by cancer type.
# prostate cancer
prostate <- fragInfo[,c(1,2)]
# this grabs the loci that are prostate, has a 1 in the PRAD column.
prostate <- prostate[!(prostate$PRAD < 1),] # the ! means "is not less than 1" (aka removes 0s.)
length_prostate <- length(as.factor(prostate$locus)) # this is to get the number of loci in prostate cancer.

# pancreatic cancer
pancreatic <- fragInfo[,c(1,3)]
pancreatic <- pancreatic[!(pancreatic$PAAD < 1),]

# liver cancer
liver <- fragInfo[,c(1,4)]
liver <- liver[!(liver$LIHC < 1),]

# lung squamous
lung_squamous <- fragInfo[,c(1,5)]
lung_squamous <- lung_squamous[!(lung_squamous$LUSC < 1),]

# lung adenocarcinoma
lung_adeno <- fragInfo[,c(1,6)]
lung_adeno <- lung_adeno[!(lung_adeno$LUAD < 1),]

# bladder cancer
bladder <- fragInfo[,c(1,7)]
bladder <- bladder[!(bladder$BLCA < 1),]

# rectal cancer
rectal <- fragInfo[,c(1,8)]
rectal <- rectal[!rectal$READ < 1,]

# colon cancer
colon <- fragInfo[,c(1,9)]
colon <- colon[!colon$COAD < 1,]

# uterine cancer
uterine <- fragInfo[,c(1,10)]
uterine <- uterine[!uterine$UC < 1,]

# ovarian cancer
ovarian <- fragInfo[,c(1,11)]
ovarian <- ovarian[!ovarian$OV < 1,]

# breast cancer
breast <- fragInfo[,c(1,12)]
breast <- breast[!breast$BRCA < 1,]

# pancancer
pancancer <- fragInfo[,c(1,13)]
pancancer <- pancancer[!pancancer$PANCAN < 1,]

# blood 
blood <- fragInfo [,c(1,14)]
blood <- blood[!blood$BLOOD < 1,]

# joining the cancer data with the sample data

methylation_prostate <- full_join(HD806_100ng_25X_S1_S2, prostate, 
                                  by = "locus")
methylation_prostate <- methylation_prostate[complete.cases(methylation_prostate),]

length_prostate <- length(as.factor(methylation_prostate$locus)) # this is to get the number of loci in prostate cancer.

methylation_pancreatic <- full_join(HD806_100ng_25X_S1_S2, pancreatic, 
                                    by = "locus")
methylation_pancreatic <- methylation_pancreatic[complete.cases(methylation_pancreatic),]
length_pancreatic <- length(as.factor(methylation_pancreatic$locus))

methylation_liver <- full_join(HD806_100ng_25X_S1_S2, liver, by = "locus")
methylation_liver <- methylation_liver[complete.cases(methylation_liver),]
length_liver <- length(as.factor(methylation_liver$locus))

methylation_lungsquamous <- full_join(HD806_100ng_25X_S1_S2, lung_squamous, 
                                      by ="locus")
methylation_lungsquamous <- methylation_lungsquamous[complete.cases(methylation_lungsquamous),]
length_lungsquamous <- length(as.factor(methylation_lungsquamous$locus))

methylation_lungadeno <- full_join(HD806_100ng_25X_S1_S2, lung_adeno,
                                   by = "locus")
methylation_lungadeno <- methylation_lungadeno[complete.cases(methylation_lungadeno),]
length_lungadeno <- length(as.factor(methylation_lungadeno$locus))

methylation_bladder <- full_join(HD806_100ng_25X_S1_S2, bladder,
                                 by = "locus")
methylation_bladder <- methylation_bladder[complete.cases(methylation_bladder),]
length_bladder <- length(as.factor(methylation_bladder$locus))

methylation_rectal <- full_join(HD806_100ng_25X_S1_S2, rectal,
                                by = "locus")
methylation_rectal <- methylation_rectal[complete.cases(methylation_rectal),]
length_rectal <- length(as.factor(methylation_rectal$locus))

methylation_colon <- full_join(HD806_100ng_25X_S1_S2, colon,
                               by = "locus")
methylation_colon <- methylation_colon[complete.cases(methylation_colon),]
length_colon <- length(as.factor(methylation_colon$locus))

methylation_uterine <- full_join(HD806_100ng_25X_S1_S2, uterine,
                                 by = "locus")
methylation_uterine <- methylation_uterine[complete.cases(methylation_uterine),]
length_uterine <- length(as.factor(methylation_uterine$locus))

methylation_ovarian <- full_join(HD806_100ng_25X_S1_S2, ovarian,
                                 by = "locus")
methylation_ovarian <- methylation_ovarian[complete.cases(methylation_ovarian),]
length_ovarian <- length(as.factor(methylation_ovarian$locus))

methylation_breast <- full_join(HD806_100ng_25X_S1_S2, breast,
                                by = "locus")
methylation_breast <- methylation_breast[complete.cases(methylation_breast),]
length_breast <- length(as.factor(methylation_breast$locus))


# make dataframe of the counts
all_Counts <- data.frame(Cancer_type = c("bladder", "breast", "colon", "liver", "lung adeno",
                                         "lung squamous", "ovarian", "pancreatic", "prostate",
                                         "rectal", "uterine"),
                          Count = c(length_bladder, length_breast, length_colon, length_liver,
                                    length_lungadeno, length_lungsquamous, length_ovarian,
                                    length_pancreatic, length_prostate, length_rectal,
                                    length_uterine))
ggplot(data = all_Counts, aes(x = Cancer_type, y = Count, fill = Cancer_type)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Count), vjust = -0.3) +
  theme_minimal() +
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank()) +
  scale_fill_brewer(palette = "Paired") +
  ggtitle(paste (c("Counts of Cancer Types ", " Loci in Meth Panel v3"), sep=" ", 
                 collapse = toString(length_fragInfo)) )

  