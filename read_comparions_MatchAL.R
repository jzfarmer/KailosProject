# MatchAL oncocyte read comparisons

# read in the files
library(dplyr)
library(ggplot2)
library(ggpubr)
S2 <- read.table("ONC-55-022-S1-S2_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S3 <- read.table("ONC-55-023-S1-S3_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S4 <- read.table("ONC-55-028-S1-S4_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S5 <- read.table("ONC-55-017-S1-S5_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S8 <- read.table("ONC-04-143-S1-S8_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S9 <- read.table("ONC-55-013-S1-S9_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S10 <- read.table("ONC-31-017-S1-S10_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')
S11 <- read.table("ONC-31-026-S1-S11_allMolecules.txt", 
                  header = T, 
                  row.names = NULL, # have to use row names = null because there are duplicate row names
                  sep = '\t')

# blood markers
# S2
Blood_S2 <- S2[,c(2,8)]
Blood_S2 <-Blood_S2 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S2 <- Blood_S2[!(Blood_S2$numReads < 5),] # filter out reads <5
Blood_S2Graph <- ggplot(data = Blood_S2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-55-022-S1-S2")) +
  ylab("Amplicon count") +
  xlim(5,2500) +
  ylim(0,10)


# S3
Blood_S3 <- S3[,c(2,8)]
Blood_S3 <-Blood_S3 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S3 <- Blood_S3[!(Blood_S3$numReads < 5),] # filter out reads <5
Blood_S3Graph <- ggplot(data = Blood_S3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-55-023-S1-S3")) +
  ylab("Amplicon count") +
  ylim(0,15)

# S4
Blood_S4 <- S4[,c(2,8)]
Blood_S4 <-Blood_S4 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S4 <- Blood_S4[!(Blood_S4$numReads < 5),] # filter out reads <5
Blood_S4Graph <- ggplot(data = Blood_S4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-55-028-S1-S4")) +
  ylab("Amplicon count")

# S5
Blood_S5 <- S5[,c(2,8)]
Blood_S5 <-Blood_S5 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S5 <- Blood_S5[!(Blood_S5$numReads < 5),] # filter out reads <5
Blood_S5Graph <- ggplot(data = Blood_S5) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-55-017-S1-S5")) +
  ylab("Amplicon count") +
  ylim(0,10)

# S8
Blood_S8 <- S8[,c(2,8)]
Blood_S8 <-Blood_S8 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S8 <- Blood_S8[!(Blood_S8$numReads < 5),] # filter out reads <5
Blood_S8Graph <- ggplot(data = Blood_S8) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-04-143-S1-S8")) +
  ylab("Amplicon count") +
  ylim(0,10)


# S9
Blood_S9 <- S9[,c(2,8)]
Blood_S9 <-Blood_S9 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S9 <- Blood_S9[!(Blood_S9$numReads < 5),] # filter out reads <5
Blood_S9Graph <- ggplot(data = Blood_S9) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-55-013-S1-S9")) +
  ylab("Amplicon count") +
  ylim(0,10)

# S10
Blood_S10 <- S10[,c(2,8)]
Blood_S10 <-Blood_S10 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S10 <- Blood_S10[!(Blood_S10$numReads < 5),] # filter out reads <5
Blood_S10Graph <- ggplot(data = Blood_S10) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-31-017-S1-S10")) +
  ylab("Amplicon count") +
  ylim(0,5)

# S11
Blood_S11 <- S11[,c(2,8)]
Blood_S11 <-Blood_S11 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S11 <- Blood_S11[!(Blood_S11$numReads < 5),] # filter out reads <5
Blood_S11Graph <- ggplot(data = Blood_S11) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
ONC-31-026-S1-S11")) +
  ylab("Amplicon count") +
  ylim(0,5)

ggarrange(Blood_S2Graph, Blood_S3Graph,Blood_S4Graph, 
          Blood_S5Graph, Blood_S8Graph, Blood_S9Graph,
          Blood_S10Graph,Blood_S11Graph,
          ncol = 2, nrow = 4) 

# Pancancer
# S2 Pancancer
Pancancer_S2 <- S2[,c(2,8)]
Pancancer_S2 <-Pancancer_S2 %>% filter(
  locus %in% c("pancan-8-cg04739647-chr2_176987433_176987545-8", "pancan-10-cg20072171-chr3_62356850_62357007-10","pancan-18-cg14428146-chr8_23563822_23563978-18","pancan-19-cg13324546-chr8_23563978_23564101-19", "pancan-20-cg22747746-chr8_23564185_23564337-20","pancan-21-cg14038391-chr10_102900030_102900174-21","pancan-25-cg00986824-chr12_75601394_75601509-25","pancan-26-cg07614018-chr19_18811452_18811616-26")
)
Pancancer_S2 <- Pancancer_S2[!(Pancancer_S2$numReads < 5),] # filter out reads <5
Pancancer_S2Graph <- ggplot(data = Pancancer_S2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-55-022-S1-S2")) +
  ylab("Amplicon count") +
  ylim(0,5)


# S3 Pancancer
Pancancer_S3 <- S3[,c(2,8)]
Pancancer_S3 <-Pancancer_S3 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S3 <- Pancancer_S3[!(Pancancer_S3$numReads < 5),] # filter out reads <5
Pancancer_S3Graph <- ggplot(data = Pancancer_S3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-55-023-S1-S3")) +
  ylab("Amplicon count") +
  ylim(0,15)


# S4 Pancancer
Pancancer_S4 <- S4[,c(2,8)]
Pancancer_S4 <-Pancancer_S4 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S4 <- Pancancer_S4[!(Pancancer_S4$numReads < 5),] # filter out reads <5
Pancancer_S4Graph <- ggplot(data = Pancancer_S4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-55-028-S1-S4")) +
  ylab("Amplicon count")

# S5 Pancancer
Pancancer_S5 <- S5[,c(2,8)]
Pancancer_S5 <-Pancancer_S5 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S5 <- Pancancer_S5[!(Pancancer_S5$numReads < 5),] # filter out reads <5
Pancancer_S5Graph <- ggplot(data = Pancancer_S5) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-55-017-S1-S5")) +
  ylab("Amplicon count") +
  ylim(0,10)

# S8 Pancancer
Pancancer_S8 <- S8[,c(2,8)]
Pancancer_S8 <-Pancancer_S8 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S8 <- Pancancer_S8[!(Pancancer_S8$numReads < 5),] # filter out reads <5
Pancancer_S8Graph <- ggplot(data = Pancancer_S8) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-04-143-S1-S8")) +
  ylab("Amplicon count") +
  ylim(0,10)


# S9 Pancancer
Pancancer_S9 <- S9[,c(2,8)]
Pancancer_S9 <-Pancancer_S9 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S9 <- Pancancer_S9[!(Pancancer_S9$numReads < 5),] # filter out reads <5
Pancancer_S9Graph <- ggplot(data = Pancancer_S9) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-55-013-S1-S9")) +
  ylab("Amplicon count") +
  ylim(0,10)


# S10 Pancancer
Pancancer_S10 <- S10[,c(2,8)]
Pancancer_S10 <-Pancancer_S10 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S10 <- Pancancer_S10[!(Pancancer_S10$numReads < 5),] # filter out reads <5
Pancancer_S10Graph <- ggplot(data = Pancancer_S10) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-31-017-S1-S10")) +
  ylab("Amplicon count") +
  ylim(0,10)


# S11 Pancancer
Pancancer_S11 <- S11[,c(2,8)]
Pancancer_S11 <-Pancancer_S11 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S11 <- Pancancer_S11[!(Pancancer_S11$numReads < 5),] # filter out reads <5
Pancancer_S11Graph <- ggplot(data = Pancancer_S11) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
ONC-31-026-S1-S11")) +
  ylab("Amplicon count") +
  ylim(0,5)

ggarrange(Pancancer_S2Graph, Pancancer_S3Graph,
          Pancancer_S4Graph, Pancancer_S5Graph,
          Pancancer_S8Graph, Pancancer_S9Graph,
          Pancancer_S10Graph, Pancancer_S11Graph,
          ncol = 2, nrow = 4)
