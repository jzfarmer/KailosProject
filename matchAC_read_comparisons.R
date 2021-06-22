# MatchAC read comparison graphs, S1-S7 samples
# read in the files

S1 <- read.table("MatchAC/Meth-Ctrl-100ng-S1-S1_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S2 <- read.table("MatchAC/Non-Meth-100ng-S1-S2_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S3 <- read.table("MatchAC/Non-Meth-80ng-S1-S3_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S4 <- read.table("MatchAC/Non-Meth-60ng-S1-S4_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S5 <- read.table("MatchAC/Non-Meth-40ng-S1-S5_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S6 <- read.table("MatchAC/Non-Meth-20ng-S1-S6_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')
S7 <- read.table("MatchAC/Non-Meth-10ng-S1-S7_allMolecules.txt", 
                 header = T, 
                 row.names = NULL, # have to use row names = null because there are duplicate row names
                 sep = '\t')


# blood markers
# S1 Blood
Blood_S1 <- S1[,c(2,8)]
Blood_S1 <-Blood_S1 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S1 <- Blood_S1[!(Blood_S1$numReads < 5),] # filter out reads <5
Blood_S1Graph <- ggplot(data = Blood_S1) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Meth-Ctrl-100ng-S1-S1")) +
  ylab("Amplicon count")

# S2 Blood
Blood_S2 <- S2[,c(2,8)]
Blood_S2 <-Blood_S2 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S2 <- Blood_S2[!(Blood_S2$numReads < 5),] # filter out reads <5
Blood_S2Graph <- ggplot(data = Blood_S2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-100ng-S1-S2")) +
  ylab("Amplicon count")

# S3 Blood
Blood_S3 <- S3[,c(2,8)]
Blood_S3 <-Blood_S3 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S3 <- Blood_S3[!(Blood_S3$numReads < 5),] # filter out reads <5
Blood_S3Graph <- ggplot(data = Blood_S3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-80ng-S1-S3")) +
  ylab("Amplicon count")

# S4 Blood
Blood_S4 <- S4[,c(2,8)]
Blood_S4 <-Blood_S4 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S4 <- Blood_S4[!(Blood_S4$numReads < 5),] # filter out reads <5
Blood_S4Graph <- ggplot(data = Blood_S4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-60ng-S1-S4")) +
  ylab("Amplicon count")

# S5 Blood
Blood_S5 <- S5[,c(2,8)]
Blood_S5 <-Blood_S5 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S5 <- Blood_S5[!(Blood_S5$numReads < 5),] # filter out reads <5
Blood_S5Graph <- ggplot(data = Blood_S5) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-40ng-S1-S5")) +
  ylab("Amplicon count")

# S6 Blood
Blood_S6 <- S6[,c(2,8)]
Blood_S6 <-Blood_S6 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S6 <- Blood_S6[!(Blood_S6$numReads < 5),] # filter out reads <5
Blood_S6Graph <- ggplot(data = Blood_S6) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-20ng-S1-S6")) +
  ylab("Amplicon count")

# S7 Blood
Blood_S7 <- S7[,c(2,8)]
Blood_S7 <-Blood_S7 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Blood_S7 <- Blood_S7[!(Blood_S7$numReads < 5),] # filter out reads <5
Blood_S7Graph <- ggplot(data = Blood_S7) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Blood
Non-Meth-10ng-S1-S7")) +
  ylab("Amplicon count")

ggarrange(Blood_S1Graph, Blood_S2Graph,Blood_S3Graph, 
          Blood_S4Graph, Blood_S5Graph, Blood_S6Graph,
          Blood_S7Graph,
          ncol = 2, nrow = 4) 

# Pancancer markers
# S1 Pancancer
Pancancer_S1 <- S1[,c(2,8)]
Pancancer_S1 <-Pancancer_S1 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S1 <- Pancancer_S1[!(Pancancer_S1$numReads < 5),] # filter out reads <5
Pancancer_S1Graph <- ggplot(data = Pancancer_S1) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
Meth-Ctrl-100ng-S1-S1")) +
  ylab("Amplicon count")

# S2 Pancancer
Pancancer_S2 <- S2[,c(2,8)]
Pancancer_S2 <-Pancancer_S2 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S2 <- Pancancer_S2[!(Pancancer_S2$numReads < 5),] # filter out reads <5
Pancancer_S2Graph <- ggplot(data = Pancancer_S2) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
Non-Meth-100ng-S1-S2")) +
  ylab("Amplicon count")

# S3 Pancancer
Pancancer_S3 <- S3[,c(2,8)]
Pancancer_S3 <-Pancancer_S3 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S3 <- Pancancer_S3[!(Pancancer_S3$numReads < 5),] # filter out reads <5
Pancancer_S3Graph <- ggplot(data = Pancancer_S3) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
Non-Meth-80ng-S1-S3")) +
  ylab("Amplicon count")

# S4 Pancancer
Pancancer_S4 <- S4[,c(2,8)]
Pancancer_S4 <-Pancancer_S4 %>% filter(
  locus %in% c("blood-1-cg07865091-chr1_43814286_43814441", "blood-2-cg08706567_cg13393721-chr1_43815020_43815167","blood-3-cg08535938-chr1_161128968_161129092","blood-4-cg16817180-chr4_981454_981558","blood-5-cg21448513-chr8_57103511_57103669","blood-6-cg09148852-chr12_122235067_122235172","blood-7-cg07218880-chr13_115046160_115046282","blood-8-cg12952132-chr19_55417539_55417665")
)
Pancancer_S4 <- Pancancer_S4[!(Pancancer_S4$numReads < 5),] # filter out reads <5
Pancancer_S4Graph <- ggplot(data = Pancancer_S4) + 
  geom_bar(mapping = aes(x = numReads)) +
  ggtitle(paste("Number of Molecules Pancancer
Non-Meth-60ng-S1-S4")) +
  ylab("Amplicon count")
